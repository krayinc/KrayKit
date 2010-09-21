//
//  NSDateFormatter+Format.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/20.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/NSDateFormatter+Format.h>


@implementation NSDateFormatter (Format)

+(NSDateFormatter *)rfc2822 {
  NSDateFormatter *result = [NSDateFormatter new];
  
  NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
  [result setLocale: locale];
  [locale release];
  
  [result setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];

  return [result autorelease];
}

@end
