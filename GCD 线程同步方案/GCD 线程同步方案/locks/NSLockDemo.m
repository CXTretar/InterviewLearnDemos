//
//  NSLockDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()

@property(nonatomic, strong) NSLock *moneyLock;
@property(nonatomic, strong) NSLock *ticketLock;

@end

@implementation NSLockDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__drawMoney {
    [self.moneyLock lock];
    
    [super __drawMoney];
    
    [self.moneyLock unlock];
}

- (void)__saveMoney {
    
    [self.moneyLock lock];
    
    [super __saveMoney];
    
    [self.moneyLock unlock];
}

- (void)__saleTicket {
    
    [self.ticketLock lock];
    
    [super __saleTicket];
    
    [self.ticketLock unlock];
}



@end
