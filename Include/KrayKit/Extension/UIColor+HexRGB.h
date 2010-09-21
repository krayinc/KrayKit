//
//  UIColor+HexRGB.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIColor (KrayKitHexRGBAddition)

+(UIColor *)colorWithHexRGB:(NSString*)string alpha:(CGFloat)alpha;

@end
