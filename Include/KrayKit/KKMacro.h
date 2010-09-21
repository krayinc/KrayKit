//
//  KKMacro.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/08/04.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifdef DEBUG
#  define LOG(...) NSLog(__VA_ARGS__)
#  define OBJDUMP(...) NSLog(@"%@", __VA_ARGS__)
#  define RECTDUMP(rect) NSLog(@"x = %f, y = %f, width = %f, height = %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#  define LOG_METHOD NSLog(@"%s", __func__)
#else
#  define LOG(...) ;
#  define OBJDUMP(...) ;
#  define RECTDUMP(...) ;
#  define LOG_METHOD ;
#endif

#define CURRENT_POS [NSString stringWithFormat:@"%s:%d",__func__, __LINE__]

//
#define SINGLETON_INTERFACE +(id)instance;

//
#define SINGLETON_IMPLEMENTATION \
\
static id _instance = nil;\
\
+ (id)instance {\
  @synchronized(self) {\
    if (_instance == nil) { _instance = [[self alloc] init]; }\
  }\
  return _instance;\
}\
\
+ (id)allocWithZone:(NSZone *)zone {\
  @synchronized(self) {\
    if (_instance == nil) {\
      _instance = [super allocWithZone:zone];\
      return _instance;\
    }\
  }\
  return nil;\
}\
\
- (id)copyWithZone:(NSZone *)zone {\
  return self;\
}\
\
- (id)retain {\
  return self;\
}\
\
- (unsigned)retainCount {\
  return UINT_MAX;\
}\
\
- (void)release {\
}\
\
- (id)autorelease {\
  return self;\
}

//
#define ALERT(msg) \
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil\
                                                  message:msg\
                                                 delegate:nil\
                                        cancelButtonTitle:nil\
                                        otherButtonTitles:@"OK",nil];\
  [alert show];\
  [alert release];

//
#define VARIADIC_TO_ARRAY(firstObject, resultArray)\
  id object;\
  va_list argumentList;\
  if (firstObject) {\
    [resultArray addObject:firstObject];\
    va_start(argumentList, firstObject);\
    while (object = va_arg(argumentList, id)) { [resultArray addObject:object]; }\
    va_end(argumentList);\
  }

//
#define RELEASE_IF_EXIST(obj)\
  if (obj) {\
    [obj release];\
    obj = nil;\
  }
