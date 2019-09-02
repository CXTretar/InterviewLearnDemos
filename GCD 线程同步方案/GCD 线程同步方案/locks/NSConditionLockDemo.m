//
//  NSConditionLockDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()

@property(nonatomic, strong) NSConditionLock *conditionLock;

@end

@implementation NSConditionLockDemo

- (void)moneyTest {}
- (void)ticketTest {}

- (instancetype)init {
    if (self = [super init]) {
        
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:1]; // 直接 init 就是 0
        
    }
    return self;
}

- (void)otherTest {
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one {
    [self.conditionLock lockWhenCondition:1];
    
    NSLog(@"__one");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two {
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"__two");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)__three {
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"__three");
    
    [self.conditionLock unlock];
}

@end
