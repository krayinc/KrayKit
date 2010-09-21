//
//  NSArray+Access.m
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/09/14.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/Extension/NSArray+Access.h>


@implementation NSArray (KrayKitAccessAddition)

-(id)first {
  return [self objectAtIndex:0];
}

-(id)last {
  return [self lastObject];
}

@end
