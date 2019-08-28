//
//  NSMutableDictionary+EXtension.m
//  runtime 方法交换的运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import " +EXtension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (EXtension)

+ (void)load {
    // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
    Class cls = NSClassFromString(@"__NSDictionaryM");
    Method originMethod = class_getInstanceMethod(cls, @selector(setObject:forKeyedSubscript:));
    Method overrideMehtod = class_getInstanceMethod(cls, @selector(cx_setObject:forKeyedSubscript:));
    method_exchangeImplementations(originMethod, overrideMehtod);
    
    Class cls2 = NSClassFromString(@"__NSDictionaryI");
    Method originMethod2 = class_getInstanceMethod(cls2, @selector(objectForKeyedSubscript:));
    Method overrideMehtod2 = class_getInstanceMethod(cls2, @selector(cx_objectForKeyedSubscript:));
    method_exchangeImplementations(originMethod2, overrideMehtod2);
}

// 设值
- (void)cx_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (key) { // 拦截key为nil的情况
        [self cx_setObject:obj forKeyedSubscript:key];
    }
}

// 取值, 包含 NSDictionary 的取值
- (id)cx_objectForKeyedSubscript:(id)key {
    if (key) {  // 拦截key为nil的情况
        return [self cx_objectForKeyedSubscript:key];
    }
    return nil;
}

@end
