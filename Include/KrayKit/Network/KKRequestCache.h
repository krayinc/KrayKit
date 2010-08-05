//
//  KKRequestCache.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <Foundation/Foundation.h>

#ifdef DEBUG
#  define KK_DEFAULT_CACHE_TTL 300
#else
#  define KK_DEFAULT_CACHE_TTL 3600
#endif

@interface KKRequestCache : NSObject <NSCoding> {
  NSURL *url;
  NSString *params;
  NSDate *expiredAt;
  NSData *data;
}

@property (nonatomic, retain, readonly) NSURL *url;
@property (nonatomic, retain, readonly) NSString *params;
@property (nonatomic, retain, readonly) NSDate *expiredAt;
@property (nonatomic, retain, readonly) NSData *data;

+(NSString *)keyFromURL:(NSURL *)url params:(NSString *)params;
+(NSString *)createCacheDirectory;
+(KKRequestCache *)loadFromURL:(NSURL *)url params:(NSString *)params;

-(KKRequestCache *)initWithURL:(NSURL *)url params:(NSString *)params;
-(BOOL)isExpired;
-(BOOL)isCached;
-(void)storeData:(NSData *)newData expiredAt:(NSDate *)date;

@end
