//
//  KKProgressIndicatorView.h
//  BizPad
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/16.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKProgressIndicatorView : UIView {
  UIActivityIndicatorView *indicator;
  UILabel *progressLabel;
  UIProgressView *progressView;
}

@property (nonatomic,retain) UIFont *font;
@property (nonatomic,retain) NSString *text;
@property (nonatomic,retain) UIColor *textColor;
@property (nonatomic,assign) UIProgressViewStyle progressViewStyle;
@property (nonatomic,assign) float progress;

@end
