//
//  SerialQueueDemo.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/3.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "SerialQueueDemo.h"

@interface SerialQueueDemo()

@property(nonatomic, strong) dispatch_queue_t moneyQueue;
@property(nonatomic, strong) dispatch_queue_t ticketQueue;

@end



@implementation SerialQueueDemo

- (instancetype)init {
    if (self = [super init]) {
        
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}


- (void)__drawMoney {
    dispatch_sync(self.moneyQueue, ^{
        
        [super __drawMoney];
        
    });
}

- (void)__saveMoney {
    
    dispatch_sync(self.moneyQueue, ^{
        
        [super __saveMoney];
        
    });
}

- (void)__saleTicket {
    
    dispatch_sync(self.moneyQueue, ^{
        
        [super __saleTicket];
        
    });
}

@end
