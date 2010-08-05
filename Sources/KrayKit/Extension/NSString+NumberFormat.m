//
//  NSString+NumberFormat.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/0803.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <KrayKit/Extension/NSString+NumberFormat.h>

@implementation NSString (NumberFormat)

+(NSString *)stringWithNumber:(NSNumber *)number currencyCode:(NSString *)currencyCode freeLabel:(NSString *)freeLabel{
  if (freeLabel != nil && ([number unsignedIntegerValue] == 0)) { return freeLabel; }
  NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
  [formatter setFormatterBehavior:NSNumberFormatterBehaviorDefault];
  [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
  [formatter setCurrencyCode:currencyCode];
  NSString *result = [formatter stringFromNumber:number];
  [formatter release];
  return result;
}

@end
