//
//  KKURLRequestOperation.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/03.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <KrayKit/Network/KKURLRequestOperation.h>


@implementation KKURLRequestOperation

@synthesize request;

#define TRY_COUNT 3

- (KKURLRequestOperation *)initWithRequest:(NSURLRequest *)aRequest customData:(id)aData delegate:(id <KKURLRequestOperationDelegate>)aDelegate {
  if (self = [super init]) {
    delegate = aDelegate;
    request = [aRequest retain];
    customData = [aData retain];
    executing = NO;
    finished = NO;
  }
  return self;
}

- (BOOL) isConcurrent {
  return YES;
}

- (BOOL) isExecuting {
  return executing;
}

- (BOOL) isFinished {
  return finished;
}

- (void) start {
  if ([self isCancelled]) {
    [self willChangeValueForKey:@"isFinished"];
    finished = YES;
    [self didChangeValueForKey:@"isFinished"];
    return;
  }

  [self willChangeValueForKey:@"isExecuting"];
  [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
  executing = YES;
  [self didChangeValueForKey:@"isExecuting"];
}

- (void) main {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  NSData *data = nil;
  for (int i=1; i <= TRY_COUNT; i++) {
    if ([self isCancelled]) { break; }
    OBJDUMP([NSString stringWithFormat:@"Queue try: %d", i]);
    if ((data = [[self sendRequest] retain]) != nil || i == TRY_COUNT) { break; }
    [NSThread sleepUntilDate:[[NSDate date] addTimeInterval:interval]];
  }
  if (![self isCancelled]) {
    if (data != nil) { [delegate didFinishRequest:request receivedData:data customData:customData]; }
  }
  if (data != nil) { [data release]; }

  [self completeOperation];
  [pool drain];
}

- (void)completeOperation {
  [self willChangeValueForKey:@"isFinished"];
  [self willChangeValueForKey:@"isExecuting"];

  executing = NO;
  finished = YES;

  [self didChangeValueForKey:@"isExecuting"];
  [self didChangeValueForKey:@"isFinished"];
}

- (void) dealloc {
  [request release];
  [super dealloc];
}

- (NSData *)sendRequest {
  NSError *error;
  NSURLResponse *response;
  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

  if (data == nil) {
    OBJDUMP([NSString stringWithFormat:@"ERROR Cannot receive data: %@ %@",
             [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]]);
  }
  return data;
}

@end
