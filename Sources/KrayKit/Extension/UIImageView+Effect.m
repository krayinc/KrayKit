//
//  UIImageView+Effect.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/04.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <KrayKit/Extension/UIImageView+Effect.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (Effect)

-(void)roundCorner:(CGFloat)radius {
  CALayer *layer = [self layer];
  [layer setMasksToBounds:YES];
  [layer setCornerRadius:radius];
}

@end
