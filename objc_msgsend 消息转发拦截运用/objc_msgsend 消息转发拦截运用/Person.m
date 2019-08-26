//
//  Person.m
//  objc_msgsend 消息转发拦截运用
//
//  Created by CXTretar on 2019/8/26.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)study {
    NSLog(@"%s", __func__);
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    // 本来能调用的方法
    if ([self respondsToSelector:aSelector]) {
        return [super methodSignatureForSelector:aSelector];
    }
    
    // 找不到的方法
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument:NULL atIndex:0]
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
     NSLog(@"找不到%@方法", NSStringFromSelector(anInvocation.selector));
}

@end
