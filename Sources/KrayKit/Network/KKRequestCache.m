//
//  KKRequestCache.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/NSString+Digest.h>
#import <KrayKit/Network/KKRequestCache.h>


@implementation KKRequestCache

@synthesize url;
@synthesize params;
@synthesize expiredAt;
@synthesize data;

+(NSString *)keyFromURL:(NSURL *)url params:(NSString *)params {
  return [[NSString stringWithFormat:@"%@?%@", [url absoluteString], params] sha256Hexdigest];
}

+(KKRequestCache *)loadFromURL:(NSURL *)url params:(NSString *)params {
  if (params == nil) { params = @""; }
  NSString *cacheDir = [[KKRequestCache createCacheDirectory] retain];
  NSString *cacheKey = [[KKRequestCache keyFromURL:url params:params] retain];
  NSString *path = [NSString stringWithFormat:@"%@/%@", cacheDir, cacheKey];
  [cacheDir release];
  [cacheKey release];
  
  KKRequestCache *result = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
  if (result == nil) {
    result = [[[self alloc] initWithURL:url params:params] autorelease];
  }
  return result;
}

-(KKRequestCache *)initWithURL:(NSURL *)aUrl params:(NSString *)aParams {
  url       = [aUrl retain];
  params    = [aParams retain];
  expiredAt = nil;
  data      = nil;
  return self;
}

+(NSString *)createCacheDirectory {
  NSString *path = [NSHomeDirectory() stringByAppendingString:@"/Documents/Caches"];
  [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
  return path;
}

-(BOOL)isExpired {
  NSDate *now = [[NSDate date] retain];
  BOOL result = ([expiredAt compare:now] == NSOrderedAscending);
  [now release];
  return result;
}

-(BOOL)isCached {
  return expiredAt != nil;
}

-(NSString *)cachePath {
  return [NSString stringWithFormat:@"%@/%@", [KKRequestCache createCacheDirectory], [KKRequestCache keyFromURL:url params:params]];
}

-(void)storeData:(NSData *)newData expiredAt:(NSDate *)date {
  data      = [newData retain];
  expiredAt = [date retain];
  [NSKeyedArchiver archiveRootObject:self toFile:[self cachePath]];
}

-(void)dealloc {
  [url release];
  [params release];
  [expiredAt release];
  [data release];
  [super dealloc];
}

#pragma mark -
#pragma mark NSCoding implementation

- (void)encodeWithCoder:(NSCoder *)aCoder {
  [aCoder encodeObject:url forKey:@"url"];
  [aCoder encodeObject:params forKey:@"params"];
  [aCoder encodeObject:expiredAt forKey:@"expiredAt"];
  [aCoder encodeObject:data forKey:@"data"];
}

- (id)initWithCoder:(NSCoder *)aDecoder{
  self = [super init];
  if (self != nil) {
    url       = [[aDecoder decodeObjectForKey:@"url"] retain];
    params    = [[aDecoder decodeObjectForKey:@"params"] retain];
    expiredAt = [[aDecoder decodeObjectForKey:@"expiredAt"] retain];
    data      = [[aDecoder decodeObjectForKey:@"data"] retain];
  }
  return self;
}

@end
