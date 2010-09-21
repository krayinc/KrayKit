//
//  NSString+NumberFormat.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/0803.
//  Copyright 2010 KRAY Inc. All rights reserved.
//


@interface NSString (KrayKitNumberFormatAddition)

+(NSString *)stringWithNumber:(NSNumber *)number currencyCode:(NSString *)currencyCode freeLabel:(NSString *)freeLabel;

@end
