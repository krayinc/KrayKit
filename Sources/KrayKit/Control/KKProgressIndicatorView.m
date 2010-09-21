//
//  KKProgressIndicatorView.m
//  BizPad
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/16.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Control/KKProgressIndicatorView.h>


@interface KKProgressIndicatorView (Private)
-(void)initialize;
@end


@implementation KKProgressIndicatorView

@synthesize font;
@synthesize text;
@synthesize textColor;
@synthesize progressViewStyle;
@synthesize progress;

- (id)initWithFrame:(CGRect)frame {
  if (frame.size.width  < 217) { frame.size.width  = 217; }
  if (frame.size.height <  44) { frame.size.height =  44; }
  if ((self = [super initWithFrame:frame])) {
    [self initialize];
    self.frame = frame;
  }
  return self;
}

-(void)initialize {
  self.frame = CGRectMake(0, 0, 217, 44);

  indicator                  = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  indicator.frame            = CGRectMake(20, 12, 20, 20);
  indicator.backgroundColor  = [UIColor clearColor];
  indicator.autoresizingMask = UIViewAutoresizingNone;
  [indicator startAnimating];
  [self addSubview:indicator];
  
  progressLabel                  = [[UILabel alloc] init];
  progressLabel.frame            = CGRectMake(47, 10, 150, 14);
  progressLabel.backgroundColor  = [UIColor clearColor];
  progressLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  progressLabel.font             = [UIFont systemFontOfSize:12];
  [self addSubview:progressLabel];
  
  progressView                   = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
  progressView.frame             = CGRectMake(47, 27, 150, 14);
  progressView.backgroundColor   = [UIColor clearColor];
  progressView.autoresizingMask  = UIViewAutoresizingFlexibleWidth;
  progressView.progressViewStyle = UIProgressViewStyleBar;
  [self addSubview:progressView];
}

-(UIFont *)font {
  return progressLabel.font;
}

-(void)setFont:(UIFont *)newFont {
  progressLabel.font = newFont;
}

-(NSString *)text {
  return progressLabel.text;
}

-(void)setText:(NSString *)newText {
  progressLabel.text = newText;
}

-(UIColor *)textColor {
  return progressLabel.textColor;
}

-(void)setTextColor:(UIColor *)newColor {
  progressLabel.textColor = newColor;
}

-(UIProgressViewStyle)progressViewStyle {
  return progressView.progressViewStyle;
}

-(void)setProgressViewStyle:(UIProgressViewStyle)newProgressViewStyle {
  progressView.progressViewStyle = newProgressViewStyle;
}

-(float)progress {
  return progressView.progress;
}

-(void)setProgress:(float)newProgress {
  [self performSelectorInBackground:@selector(setProgressToProgressView:) withObject:[NSNumber numberWithFloat:newProgress]];
}

-(void)setProgressToProgressView:(NSNumber *)newProgress {
  progressView.progress = [newProgress floatValue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
  [indicator release];
  [progressLabel release];
  [progressView release];
  [super dealloc];
}

@end
