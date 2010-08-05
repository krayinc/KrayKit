//
//  NSString+Digest.h
//  KrayKit
//
//  Created by Takatoshi -morimori- MORIYAMA on 10/0803.
//  Copyright 2010 KRAY Inc. All rights reserved.
//

#import <KrayKit/KKMacro.h>
#import <Foundation/Foundation.h>


@interface NSString (Digest)

-(NSString *)md5Hexdigest;
-(NSString *)sha1Hexdigest;
-(NSString *)sha256Hexdigest;

@end
