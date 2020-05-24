//
//  CXProxy.h
//  NSTimer 定时器
//
//  Created by CXTretar on 2019/9/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXProxy : NSProxy

@property(nonatomic, weak) id target;

+ (instancetype)proxyWithTarget:(id)target;

@end
