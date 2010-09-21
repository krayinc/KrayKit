//
//  KKAuthAlertView.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/20.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKAuthAlertView : UIAlertView {
  UITextField *passwordField;
}

-(NSString *)password;

@end
