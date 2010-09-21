//
//  KKAuthAlertView.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/20.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Control/KKAuthAlertView.h>


@implementation KKAuthAlertView


- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)firstButtonTitle, ... {
  NSMutableArray *otherButtonTitles = [NSMutableArray new];
  VARIADIC_TO_ARRAY(firstButtonTitle, otherButtonTitles);
  if (self = [super initWithTitle:title message:[NSString stringWithFormat:@"%@\n", message] delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 45.0, 245.0, 25.0)];
    passwordField.secureTextEntry        = YES;
    passwordField.returnKeyType          = UIReturnKeyDone;
    passwordField.keyboardType           = UIKeyboardTypeASCIICapable;
    passwordField.keyboardAppearance     = UIKeyboardAppearanceAlert;
    passwordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordField.autocorrectionType     = UITextAutocorrectionTypeNo;
    passwordField.borderStyle            = UITextBorderStyleRoundedRect;
    [self addSubview:passwordField];

    [passwordField becomeFirstResponder];

    for (NSString *buttonTitle in otherButtonTitles) {
      [self addButtonWithTitle:buttonTitle];
    }

    CGAffineTransform trans = CGAffineTransformMakeTranslation(0.0, 100.0); 
    [self setTransform:trans];
  }
  return self;
}
/*
- (id)initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame])) {
    // Initialization code
  }
  return self;
}
*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
  [passwordField release];
  [super dealloc];
}

-(NSString *)password {
  return passwordField.text;
}

@end
