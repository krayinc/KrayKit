//
//  UIRemoteImageView.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/05.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Control/KKRemoteImageView.h>


@implementation KKRemoteImageView

@synthesize request;
@synthesize indicator;

-(id)init {
  if (self = [super init]) {
    [self initialize];
  }
  return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
  if (self = [super initWithCoder:aDecoder]) {
    [self initialize];
  }
  return self;
}

-(void)initialize {
  indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
  opQueue = [[NSOperationQueue alloc] init];
  [opQueue setMaxConcurrentOperationCount:2];
}

-(void)loadWithRequest:(NSURLRequest *)aRequest delegate:(id <KKRemoteImageViewDelegate>)aDelegate {
  self.image = nil;

  request = aRequest;
  delegate = aDelegate;

  indicator.frame = CGRectMake((self.frame.size.width-20)/2, (self.frame.size.height-20)/2, 20, 20);
  [indicator startAnimating];
  [self addSubview:indicator];
  
  KKURLRequestOperation *operation = [[KKURLRequestOperation alloc] initWithRequest:request customData:nil delegate:self];
  [opQueue addOperation:operation];
  [operation release];
}

-(void)didFinishRequest:(NSURLRequest *)aRequest receivedData:(NSData *)receivedData customData:(id)customData {
  [indicator stopAnimating];

  if (request != aRequest) { return; }

  self.image = [UIImage imageWithData:receivedData];
}

-(void)dealloc {
  delegate = nil;
  [indicator release];
  [opQueue release];
  [super dealloc];
}

@end
