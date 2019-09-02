//
//  OSSpinLockDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo ()

@property(nonatomic, assign) OSSpinLock *moneyLock;
@property(nonatomic, assign) OSSpinLock *ticketLock;

@end

@implementation OSSpinLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__drawMoney {
    OSSpinLockLock(&_moneyLock);
    
    [super __drawMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saveMoney {
    
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saleTicket {
    OSSpinLockLock(&_ticketLock);
    
    [super __saleTicket];
    
    OSSpinLockUnlock(&_ticketLock);
}

@end
