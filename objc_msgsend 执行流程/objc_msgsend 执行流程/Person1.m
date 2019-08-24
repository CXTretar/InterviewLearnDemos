//
//  Person1.m
//  objc_msgsend 执行流程
//
//  Created by CXTretar on 2019/8/24.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person1.h"
#import <objc/runtime.h>

@implementation Person1

// 类方法
void c_other_method(id self, SEL _cmd) {
    NSLog(@"c_other - %@ - %@", self, NSStringFromSelector(_cmd));
}

+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(classMethod)) {
        // 第一个参数是object_getClass(self)
        class_addMethod(object_getClass(self), sel, (IMP)c_other_method, "v16@0:8");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

// 对象方法
struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};

- (void)otherMethod {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(instanceMethod)) {
        // 获取其他方法
        struct method_t *method = (struct method_t *)class_getInstanceMethod(self, @selector(otherMethod));

        // 动态添加instanceMethod方法的实现
        class_addMethod(self, sel, method->imp, method->types);

        // 返回YES代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
