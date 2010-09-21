//
//  NSDate+Format.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/20.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/NSDate+Format.h>
#import <KrayKit/Extension/NSDateFormatter+Format.h>


@implementation NSDate (Format)

+(NSDate *)dateWithRFC2822String:(NSString *)str {
  return [[[NSDate alloc] initWithRFC2822String:str] autorelease];
}

-(NSDate *)initWithRFC2822String:(NSString *)str {
  NSDateFormatter *parser = [NSDateFormatter rfc2822];
  NSDate *result = [parser dateFromString:str];
  return [result retain];
}

@end
