//
//  NSConditionDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo()

@property(nonatomic, strong) NSCondition *condition;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation NSConditionDemo

- (void)moneyTest {}
- (void)ticketTest {}

- (instancetype)init {
    if (self = [super init]) {
        self.condition = [[NSCondition alloc] init];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)otherTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self __remove];
        [self __remove];
        [self __remove];
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self __add];
        [self __add];
        [self __add];
    });
    
    //     [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    //    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

// 生产者-消费者模式

// 线程1
// 删除数组中的元素
- (void)__remove {
    [self.condition lock];
    NSLog(@"__remove - begin");
    
    if (self.data.count == 0) {
        // 等待
       [self.condition wait];
    }
    
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
   [self.condition unlock];
}

// 线程2
// 往数组中添加元素
- (void)__add {
    [self.condition lock];
    
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    // 信号
    [self.condition signal];
    // 广播
    //    pthread_cond_broadcast(&_cond);
    
    [self.condition unlock];
}

@end
