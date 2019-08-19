//
//  main.m
//  OC对象的本质
//
//  Created by CXTretar on 2019/8/19.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import "Person.h"

struct NSObject_IMPL {
    Class isa;
};

struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _height;
    int _no;
}; // 计算结构体大小，内存对齐，24

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        
        NSLog(@"%zd", sizeof(struct Person_IMPL)); // 24

        NSLog(@"%zd %zd",
              class_getInstanceSize([Person class]), // 24
              malloc_size((__bridge const void *)(p))); // 32
    }
    return 0;
}
