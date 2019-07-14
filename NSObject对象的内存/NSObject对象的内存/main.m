//
//  main.m
//  NSObject对象的内存
//
//  Created by CXTretar on 2019/7/14.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa; // 8个字节
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object = [[NSObject alloc]init];
        
        // 获得NSObject实例对象的成员变量所占用的大小 >> 8
        NSLog(@"class_getInstanceSize -- %zd", class_getInstanceSize([NSObject class]));
        
        // 获得obj指针所指向内存的大小 >> 16
        NSLog(@"malloc_size -- %zd", malloc_size((__bridge const void *)object));
    }
    return 0;
}
