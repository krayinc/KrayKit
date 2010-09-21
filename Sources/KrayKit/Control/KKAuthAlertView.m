//
//  KKAuthAlertView.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/20.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Control/KKAuthAlertView.h>


@implementation KKAuthAlertView

@synthesize buttonIndexForEnterKey;


- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)firstButtonTitle, ... {
  NSMutableArray *otherButtonTitles = [NSMutableArray new];
  VARIADIC_TO_ARRAY(firstButtonTitle, otherButtonTitles);
  NSString *fixedMessage;
  float yOffset = 0;
  if ([message isEqualToString:@""] || nil) {
    fixedMessage = @"\n";
  } else {
    fixedMessage = [NSString stringWithFormat:@"%@\n\n", message];
    yOffset += [UIFont systemFontSize] + 10;
  }
  if (self = [super initWithTitle:title message:fixedMessage delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil]) {
    buttonIndexForEnterKey = -1;

    passwordField = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 45.0 + yOffset, 245.0, 25.0)];
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

- (void)dealloc {
  [passwordField release];
  [super dealloc];
}

-(NSString *)password {
  return passwordField.text;
}

-(void)setButtonIndexForEnterKey:(NSInteger)newIndex {
  if (newIndex < 0 || newIndex >= [self numberOfButtons]) { newIndex = -1; }
  buttonIndexForEnterKey = newIndex;
  if (newIndex == -1) {
    [passwordField removeTarget:self action:@selector(didEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
  } else {
    [passwordField addTarget:self action:@selector(didEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
  }
}

-(IBAction)didEndOnExit:(id)sender {
  if (sender == passwordField) {
    if (buttonIndexForEnterKey > -1) {
      [self.delegate alertView:self clickedButtonAtIndex:buttonIndexForEnterKey];
      [self dismissWithClickedButtonIndex:buttonIndexForEnterKey animated:YES];
    }
  }
}

@end
