//
//  UIView+Overlay.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/31.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/UIView+Overlay.h>


@implementation UIView (KrayKitOverlayAddition)

-(void)overlay:(UIView *)overlayView {
  [self addSubview:overlayView];
  [self bringSubviewToFront:overlayView];
}

@end
