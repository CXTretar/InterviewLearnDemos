//
//  Person.m
//  objc_msgsend 消息转发机制
//
//  Created by CXTretar on 2019/8/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"
#import "Cat.h"

@implementation Person

// 对象方法
- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(instanceMethod)) {
        // objc_msgSend([[Cat alloc] init], aSelector)
        return [[Cat alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

// 类方法
+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(classMethod)) {
        // objc_msgSend([[Cat alloc] init], aSelector)
        return [Cat class];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
