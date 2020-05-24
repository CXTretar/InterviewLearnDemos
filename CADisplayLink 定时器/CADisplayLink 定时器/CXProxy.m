//
//  CXProxy.m
//  NSTimer 定时器
//
//  Created by CXTretar on 2019/9/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "CXProxy.h"

@implementation CXProxy

+ (instancetype)proxyWithTarget:(id)target {
    // NSProxy对象不需要调用init，因为它本来就没有init方法
    CXProxy *proxy = [CXProxy alloc];
    proxy.target = target;
    return proxy;
}

// 消息转发给 _target
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
