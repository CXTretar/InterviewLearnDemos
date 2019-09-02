//
//  ViewController.m
//  GCD 线程同步方案
//
//  Created by CXTretar on 2019/9/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "OSSpinLockDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseDemo *demo = [[OSSpinLockDemo alloc] init];
//    [demo ticketTest];
    [demo moneyTest];
//    [demo otherTest];
    // Do any additional setup after loading the view.
}


@end
