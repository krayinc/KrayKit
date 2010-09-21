//
//  UIView+Align.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/16.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/UIView+Align.h>


@interface UIView (KrayKitAlignAdditionPrivate)
-(BOOL)hasFlexibleLeftMargin;
-(BOOL)hasFlexibleRightMargin;
-(BOOL)hasFlexibleTopMargin;
-(BOOL)hasFlexibleBottomMargin;
@end


@implementation UIView (KrayKitAlignAddition)

@dynamic horizontalAlign;
@dynamic verticalAlign;
@dynamic flexibleWidth;
@dynamic flexibleHeight;

-(BOOL)hasFlexibleLeftMargin {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleLeftMargin) > 0;
}

-(BOOL)hasFlexibleRightMargin {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleRightMargin) > 0;
}

-(BOOL)hasFlexibleTopMargin {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleTopMargin) > 0;
}

-(BOOL)hasFlexibleBottomMargin {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleBottomMargin) > 0;
}

-(UIViewHorizontalAlign)horizontalAlign {
  if ([self hasFlexibleLeftMargin] && [self hasFlexibleRightMargin]) {
    return UIViewHorizontalAlignCenter;
  } else if ([self hasFlexibleLeftMargin]) {
    return UIViewHorizontalAlignRight;
  } else if ([self hasFlexibleRightMargin]) {
    return UIViewHorizontalAlignLeft;
  } else {
    return UIViewHorizontalAlignNone;
  }
}

-(void)setHorizontalAlign:(UIViewHorizontalAlign)newAlign {
  switch (newAlign) {
    case UIViewHorizontalAlignLeft:
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleLeftMargin;
      self.autoresizingMask |=  UIViewAutoresizingFlexibleRightMargin;
      break;
    case UIViewHorizontalAlignCenter:
      self.autoresizingMask |=  UIViewAutoresizingFlexibleLeftMargin;
      self.autoresizingMask |=  UIViewAutoresizingFlexibleRightMargin;
      break;
    case UIViewHorizontalAlignRight:
      self.autoresizingMask |=  UIViewAutoresizingFlexibleLeftMargin;
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleRightMargin;
      break;
    case UIViewHorizontalAlignNone:
    default:
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleLeftMargin;
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleRightMargin;
      break;
  }
}

-(UIViewVerticalAlign)verticalAlign {
  if ([self hasFlexibleTopMargin] && [self hasFlexibleBottomMargin]) {
    return UIViewVerticalAlignMiddle;
  } else if ([self hasFlexibleTopMargin]) {
    return UIViewVerticalAlignBottom;
  } else if ([self hasFlexibleBottomMargin]) {
    return UIViewVerticalAlignTop;
  } else {
    return UIViewVerticalAlignNone;
  }
}

-(void)setVerticalAlign:(UIViewVerticalAlign)newAlign {
  switch (newAlign) {
    case UIViewVerticalAlignTop:
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleTopMargin;
      self.autoresizingMask |=  UIViewAutoresizingFlexibleBottomMargin;
      break;
    case UIViewVerticalAlignMiddle:
      self.autoresizingMask |=  UIViewAutoresizingFlexibleTopMargin;
      self.autoresizingMask |=  UIViewAutoresizingFlexibleBottomMargin;
      break;
    case UIViewVerticalAlignBottom:
      self.autoresizingMask |=  UIViewAutoresizingFlexibleTopMargin;
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleBottomMargin;
      break;
    case UIViewVerticalAlignNone:
    default:
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleTopMargin;
      self.autoresizingMask &= ~UIViewAutoresizingFlexibleBottomMargin;
      break;
  }
}

-(BOOL)flexibleWidth {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleWidth) > 0;
}

-(void)setFlexibleWidth:(BOOL)cond {
  if (cond) {
    self.autoresizingMask |=  UIViewAutoresizingFlexibleWidth;
  } else {
    self.autoresizingMask &= ~UIViewAutoresizingFlexibleWidth;
  }
}

-(BOOL)flexibleHeight {
  return (self.autoresizingMask & UIViewAutoresizingFlexibleHeight) > 0;
}

-(void)setFlexibleHeight:(BOOL)cond {
  if (cond) {
    self.autoresizingMask |=  UIViewAutoresizingFlexibleHeight;
  } else {
    self.autoresizingMask &= ~UIViewAutoresizingFlexibleHeight;
  }
}

@end
