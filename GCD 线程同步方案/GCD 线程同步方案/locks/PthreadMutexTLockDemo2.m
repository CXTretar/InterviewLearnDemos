//
//  PthreadMutexTLockDemo2.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "PthreadMutexTLockDemo2.h"
#import <pthread.h>

@interface PthreadMutexTLockDemo2 ()

@property(nonatomic, assign) pthread_mutex_t recursiveLock;

@end

@implementation PthreadMutexTLockDemo2

- (void)moneyTest {}
- (void)ticketTest {}

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_recursiveLock];
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
}

- (void)otherTest {
    pthread_mutex_lock(&_recursiveLock);
    
    static int count = 0;
    
    NSLog(@"%d - %s", count, __func__);
    
    while (count < 10) {
        count ++;
        [self otherTest];
    }
    
    pthread_mutex_unlock(&_recursiveLock);
}

// 记得销毁
- (void)dealloc {
    
    pthread_mutex_destroy(&_recursiveLock);
}

@end
