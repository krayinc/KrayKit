//
//  KKURLRequestOperation.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#pragma mark Protocol

@protocol KKURLRequestOperationDelegate

-(void)didFinishRequest:(NSURLRequest *)request receivedData:(NSData *)data customData:(id)customData;

@end


#pragma mark Interface

@interface KKURLRequestOperation : NSOperation {
  id delegate;
  NSURLRequest *request;
  id customData;
  NSTimeInterval interval;
  BOOL executing;
  BOOL finished;
}

@property (nonatomic, retain, readonly) NSURLRequest *request;

-(KKURLRequestOperation *)initWithRequest:(NSURLRequest *)aRequest customData:(id)aData delegate:(id <KKURLRequestOperationDelegate>)aDelegate;
-(NSData *) sendRequest;
-(void) completeOperation;

@end
