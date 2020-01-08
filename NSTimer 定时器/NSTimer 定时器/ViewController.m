//
//  ViewController.m
//  NSTimer 定时器
//
//  Created by CXTretar on 2019/9/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "CXProxy.h"

@interface ViewController ()

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)startTimer:(id)sender {
    
    // 使用 NSProxy 防止循环引用
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[CXProxy proxyWithTarget:self] selector:@selector(timerTest) userInfo:nil repeats:YES];
    
}


- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.timer invalidate];
}

@end
