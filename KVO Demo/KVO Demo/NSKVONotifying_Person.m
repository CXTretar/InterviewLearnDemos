//
//  NSKVONotifying_Person.m
//  KVO Demo
//
//  Created by CXTretar on 2019/9/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "NSKVONotifying_Person.h"

@implementation NSKVONotifying_Person

- (void)setAge:(int)age {
    _NSSetIntValueAndNotify();
}

// 伪代码
void _NSSetIntValueAndNotify() {
    [self willChangeValueForKey:@"age"];
    [super setAge:age];
    [self didChangeValueForKey:@"age"];
}

- (void)willChangeValueForKey:(NSString *)key {
    // 通知监听器，某某属性值即将发生改变
}

- (void)didChangeValueForKey:(NSString *)key {
    // 通知监听器，某某属性值发生了改变
    [oberser observeValueForKeyPath:key ofObject:self change:nil context:nil];
}

// 屏蔽内部实现，隐藏了NSKVONotifying_Person类的存在
- (Class)class {
    return [Person class];
}

- (void)dealloc {
    // 收尾工作
}

- (BOOL)_isKVOA {
    return YES;
}

@end
