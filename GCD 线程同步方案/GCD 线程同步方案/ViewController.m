//
//  ViewController.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"
#import "OSSpinLockDemo2.h"
#import "PthreadMutexTLockDemo.h"
#import "PthreadMutexTLockDemo2.h"
#import "PthreadMutexTLockDemo3.h"
#import "NSLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "SerialQueueDemo.h"
#import "SemaphoreDemo.h"
#import "SynchronizedDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseDemo *demo = [[SynchronizedDemo alloc] init];
    [demo ticketTest];
    [demo moneyTest];
    [demo otherTest];
    // Do any additional setup after loading the view.
}


@end
