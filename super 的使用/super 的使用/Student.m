//
//  Student.m
//  super 的使用
//
//  Created by CXTretar on 2019/8/26.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Student.h"

@implementation Student

/*
 [super message]的底层实现
 1.消息接收者仍然是子类对象
 2.从父类开始查找方法的实现
 */
- (instancetype)init {
    if (self = [super init]) {
        // objc_msgSend({self}, @selector(class)); Student 是 receiver
        NSLog(@"[self class] - %@", [self class]);
        NSLog(@"[self superclass] - %@", [self superclass]);
        
        // objc_msgSendSuper({self, [Person class]}, @selector(class)); Student 仍然是 receiver, 只不过多传入了 Person 父类, 减少调用步骤
        NSLog(@"[super class] - %@", [super class]);
        NSLog(@"[super superclass] - %@", [super superclass]);
    }
    
    return self;
}

@end
