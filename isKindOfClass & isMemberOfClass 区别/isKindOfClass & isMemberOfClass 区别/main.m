//
//  main.m
//  isKindOfClass & isMemberOfClass 区别
//
//  Created by CXTretar on 2019/8/27.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"---------- 方法接收者为对象 -------------");
        
        id person = [[Person alloc] init];
        
        NSLog(@"isMemberOfClass - Person   - %d", [person isMemberOfClass:[Person class]]);      // 1
        NSLog(@"isMemberOfClass - NSObject - %d", [person isMemberOfClass:[NSObject class]]);    // 0
        NSLog(@"isKindOfClass   - Person   - %d", [person isKindOfClass:[Person class]]);        // 1
        NSLog(@"isKindOfClass   - NSObject - %d", [person isKindOfClass:[NSObject class]]);      // 1
        
        NSLog(@"---------- 方法接收者为类对象 -------------");
        
        NSLog(@"isMemberOfClass - NSObject - %d", [NSObject isMemberOfClass:[NSObject class]]);  // 0
        NSLog(@"isMemberOfClass - Person   - %d", [Person isMemberOfClass:[Person class]]);      // 0
        NSLog(@"isKindOfClass   - NSObject - %d", [NSObject isKindOfClass:[NSObject class]]);    // 1
        NSLog(@"isKindOfClass   - Person   - %d", [Person isKindOfClass:[Person class]]);        // 0
        
        NSLog(@"---------- 方法接收者为类对象,比较对象为元类 ----------");
        
        NSLog(@"isMemberOfClass - Person元类 - %d", [Person isMemberOfClass:object_getClass([Person class])]);
        NSLog(@"isKindOfClass   - Person元类 - %d", [Person isKindOfClass:object_getClass([NSObject class])]);
        
    }
    return 0;
}
