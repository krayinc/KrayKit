/*
 *  NSDate+Format.h
 *  KrayKit
 *
 *  Created by Takatoshi -morimori- MORIYAMA on 10/09/20.
 *  Copyright 2010 KRAY Inc. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>

@interface NSDate (KrayKitFormatAddition)
+(NSDate *)dateWithRFC2822String:(NSString *)str;
-(NSDate *)initWithRFC2822String:(NSString *)str;
@end
