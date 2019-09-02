//
//  PthreadMutexTLockDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "PthreadMutexTLockDemo.h"
#import <pthread.h>

@interface PthreadMutexTLockDemo ()

@property(nonatomic, assign) pthread_mutex_t ticketLock;
@property(nonatomic, assign) pthread_mutex_t moneyLock;

@end

@implementation PthreadMutexTLockDemo

- (instancetype)init {
    if (self = [super init]) {
        [self __initMutex:&_ticketLock];
        [self __initMutex:&_moneyLock];
    }
    return self;
}

- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    // 初始化锁
    pthread_mutex_init(mutex, &attr);
    // 销毁属性
    pthread_mutexattr_destroy(&attr);
    
    // 静态初始化
    
    //      pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
    // 初始化属性传空
    
    //       pthread_mutex_init(mutex, NULL);
    
}

- (void)__drawMoney {
    pthread_mutex_lock(&_moneyLock);
    
    [super __drawMoney];
    
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__saveMoney {
    
    pthread_mutex_lock(&_moneyLock);
    
    [super __saveMoney];
    
    pthread_mutex_unlock(&_moneyLock);
}

- (void)__saleTicket {
    
    pthread_mutex_lock(&_ticketLock);
    
    [super __saleTicket];
    
    pthread_mutex_unlock(&_ticketLock);
}

- (void)dealloc {
    
    pthread_mutex_destroy(&_moneyLock);
    pthread_mutex_destroy(&_ticketLock);
}


@end
