//
//  PthreadMutexTLockDemo3.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "PthreadMutexTLockDemo3.h"
#import <pthread.h>

@interface PthreadMutexTLockDemo3 ()

@property(nonatomic, assign) pthread_mutex_t recursiveLock;
@property(nonatomic, assign) pthread_cond_t cond;
@property(nonatomic, strong) NSMutableArray *data;

@end

@implementation PthreadMutexTLockDemo3

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_recursiveLock];
        self.data = [NSMutableArray array];
    }
    return self;
}

- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
    // 初始化锁的条件
    pthread_cond_init(&_cond, NULL);
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
    pthread_mutex_lock(&_recursiveLock);
    NSLog(@"__remove - begin");
    
    if (self.data.count == 0) {
        // 等待
        pthread_cond_wait(&_cond, &_recursiveLock);
    }
    
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    pthread_mutex_unlock(&_recursiveLock);
}

// 线程2
// 往数组中添加元素
- (void)__add {
    pthread_mutex_lock(&_recursiveLock);
    
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    // 信号
    pthread_cond_signal(&_cond);
    // 广播
    //    pthread_cond_broadcast(&_cond);
    
    pthread_mutex_unlock(&_recursiveLock);
}

- (void)dealloc {
    pthread_mutex_destroy(&_recursiveLock);
    pthread_cond_destroy(&_cond);
}


@end
