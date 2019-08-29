//
//  ViewController.m
//  Runloop 处理子线程保活封装优化
//
//  Created by CXTretar on 2019/8/30.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "CXThreadManager.h"

@interface ViewController ()

@property(nonatomic, strong) CXThreadManager *threadManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.threadManager = [[CXThreadManager alloc] init];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.threadManager executeThreadTask:^{
        NSLog(@"测试任务 %s %@", __func__, [NSThread currentThread]);
    }];
}

- (IBAction)stop:(id)sender {
    
    [self.threadManager stopThread];
    
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop:nil];
}

@end
