//
//  Person1.m
//  objc_msgsend 消息转发机制
//
//  Created by CXTretar on 2019/8/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person1.h"
#import "Cat1.h"

@implementation Person1

// 方法签名：返回值类型、参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(instanceMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument:NULL atIndex:0]
- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    anInvocation.target = [[Cat alloc] init];
//    [anInvocation invoke];

    [anInvocation invokeWithTarget:[[Cat1 alloc] init]];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(classMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    //    anInvocation.target = [[Cat alloc] init];
    //    [anInvocation invoke];
    
    [anInvocation invokeWithTarget:[Cat1 class]];
}

@end
