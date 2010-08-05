//
//  UIColor+HexRGB.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <UIKit/UIKit.h>


@interface UIColor (HexRGB)

+(UIColor *)colorWithHexRGB:(NSString*)string alpha:(CGFloat)alpha;

@end
