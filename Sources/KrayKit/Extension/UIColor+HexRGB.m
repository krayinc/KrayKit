//
//  UIColor+HexRGB.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/UIColor+HexRGB.h>


@implementation UIColor (KrayKitHexRGBAddition)

+(UIColor *)colorWithHexRGB:(NSString *)hex alpha:(CGFloat)alpha {
  UIColor *color = nil;
  if (hex && [hex length] == 7) {
    unsigned red, green, blue;
    sscanf([hex UTF8String],"#%02X%02X%02X", &red, &green, &blue);
    color = [[[UIColor alloc] initWithRed:(float)red / 0xff
                                    green:(float)green / 0xff
                                     blue:(float)blue / 0xff
                                    alpha:alpha] autorelease];
  } else {
    LOG(@"\"%@\" isn't hex RGB color code.", hex);
  }

  return color;
};

-(NSString *)hexRGB {
  const int numComponents = CGColorGetNumberOfComponents(self.CGColor);
  const CGFloat *components = CGColorGetComponents(self.CGColor);
  CGFloat red, green, blue;
  if (numComponents == 4) {
    red   = components[0];
    green = components[1];
    blue  = components[2];
  } else {
    red   = components[0];
    green = components[0];
    blue  = components[0];
  }
  return [NSString stringWithFormat:@"#%02x%02x%02x", (int)(red * 0xff), (int)(green * 0xff), (int)(blue * 0xff)];
}

@end
