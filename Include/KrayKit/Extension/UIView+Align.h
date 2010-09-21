/*
 *  UIView+Align.h
 *  KrayKit
 *
 *  Created by Takatoshi -morimori- MORIYAMA on 10/09/16.
 *  Copyright 2010 KRAY Inc. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>


enum UIViewHorizontalAlign {
  UIViewHorizontalAlignNone,
  UIViewHorizontalAlignLeft,
  UIViewHorizontalAlignCenter,
  UIViewHorizontalAlignRight
};
typedef int UIViewHorizontalAlign;

enum UIViewVerticalAlign {
  UIViewVerticalAlignNone,
  UIViewVerticalAlignTop,
  UIViewVerticalAlignMiddle,
  UIViewVerticalAlignBottom
};
typedef int UIViewVerticalAlign;

@interface UIView (KrayKitAlignAddition)

@property (nonatomic,assign) UIViewHorizontalAlign horizontalAlign;
@property (nonatomic,assign) UIViewVerticalAlign verticalAlign;
@property (nonatomic,assign) BOOL flexibleWidth;
@property (nonatomic,assign) BOOL flexibleHeight;

/*
-(UIViewHorizontalAlign)horizontalAlign;
-(void)setHorizontalAlign:(UIViewHorizontalAlign)newAlign;
-(UIViewVerticalAlign)verticalAlign;
-(void)setVerticalAlign:(UIViewVerticalAlign)newAlign;
-(BOOL)flexibleWidth;
-(void)setFlexibleWidth:(BOOL)cond;
-(BOOL)flexibleHeight;
-(void)setFlexibleHeight:(BOOL)cond;
 */

@end
