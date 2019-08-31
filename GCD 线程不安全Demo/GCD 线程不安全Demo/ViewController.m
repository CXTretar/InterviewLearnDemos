//
//  ViewController.m
//  GCD 线程不安全Demo
//
//  Created by CXTretar on 2019/8/31.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, assign) int ticketsCount;
@property(nonatomic, assign) int money;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self ticketTest];
    [self moneyTest];
    // Do any additional setup after loading the view.
}

// 多线程异步卖票, 最后剩的不是 0 张票
- (void)ticketTest {
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
}

- (void)saleTicket {
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    
    NSLog(@"还剩%d张票 - %@", oldTicketsCount, [NSThread currentThread]);
}

// 多线程取钱存钱, 存 500 元, 取 200 元,最后不是 400 元
- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self drawMoney];
        }
    });
}


// 存钱
- (void)saveMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}


// 取钱
- (void)drawMoney {
    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
}


@end
