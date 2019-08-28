//
//  NSMutableArray+EXtension.m
//  runtime 方法交换的运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "NSMutableArray+EXtension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (EXtension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        Class cls = NSClassFromString(@"__NSArrayM");
        Method originMethod = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method overrideMehtod = class_getInstanceMethod(cls, @selector(cx_insertObject:atIndex:));
        method_exchangeImplementations(originMethod, overrideMehtod);
    });
}

- (void)cx_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject) { // 拦截anObject为nil的情况
        [self cx_insertObject:anObject atIndex:index];
    }
}

@end
