//
//  UIRemoteImageView.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/05.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KrayKit/Network/KKURLRequestOperation.h>


@protocol KKRemoteImageViewDelegate

@optional
-(void)didFinishLoadImage:(NSData *)data;

@end


@interface KKRemoteImageView : UIImageView <KKURLRequestOperationDelegate> {
  NSURLRequest *request;
  NSOperationQueue *opQueue;
  UIActivityIndicatorView *indicator;
  
  id delegate;
}

@property (nonatomic, retain, readonly) NSURLRequest *request;
@property (nonatomic, retain, readonly) UIActivityIndicatorView *indicator;

-(void)initialize;
-(void)loadWithRequest:(NSURLRequest *)aRequest delegate:(id <KKRemoteImageViewDelegate>)aDelegate;

@end
