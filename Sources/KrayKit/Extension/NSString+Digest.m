//
//  NSString+Digest.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/0803.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/NSString+Digest.h>
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (KrayKitDigestAddition)

-(NSString *)md5Hexdigest {
  const char *src = [self UTF8String];
  unsigned char dst[CC_MD5_DIGEST_LENGTH];
  NSMutableString *result = [[[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH] autorelease];
  
  CC_MD5(src, strlen(src), dst);
  for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) { [result appendFormat:@"%02X", dst[i]]; }
  
  return result;
}

-(NSString *)sha1Hexdigest {
  const char *src = [self UTF8String];
  unsigned char dst[CC_SHA1_DIGEST_LENGTH];
  NSMutableString *result = [[[NSMutableString alloc] initWithCapacity:CC_SHA1_DIGEST_LENGTH] autorelease];
  
  CC_SHA1(src, strlen(src), dst);
  for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) { [result appendFormat:@"%02X", dst[i]]; }
  
  return result;
}

-(NSString *)sha256Hexdigest {
  const char *src = [self UTF8String];

  unsigned char dst[CC_SHA256_DIGEST_LENGTH];
  NSMutableString *result = [[[NSMutableString alloc] initWithCapacity:CC_SHA256_DIGEST_LENGTH] autorelease];

  CC_SHA256(src, strlen(src), dst);
  for (int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i) { [result appendFormat:@"%02X", dst[i]]; }

  return result;
}

@end
