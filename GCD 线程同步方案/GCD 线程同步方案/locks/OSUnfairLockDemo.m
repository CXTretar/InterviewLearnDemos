//
//  OSUnfairLockDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@interface OSUnfairLockDemo ()

@property(nonatomic, assign) os_unfair_lock moneyLock;
@property(nonatomic, assign) os_unfair_lock ticketLock;

@end

@implementation OSUnfairLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}


- (void)__drawMoney {
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saveMoney {
    
    os_unfair_lock_lock(&_moneyLock);
    
    [super __saveMoney];
    
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saleTicket {
    
    os_unfair_lock_lock(&_ticketLock);
    
    [super __saleTicket];
    
    os_unfair_lock_unlock(&_ticketLock);
}




@end
