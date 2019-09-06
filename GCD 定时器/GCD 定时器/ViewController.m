//
//  ViewController.m
//  GCD 定时器
//
//  Created by CXTretar on 2019/9/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "GCDTimer.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.task = [GCDTimer executeTarget:self
                         selector:@selector(test)
                            start:2.0
                         interval:1.0
                          repeats:YES
                            async:NO];
}

- (void)test {
    NSLog(@"doTask - %@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [GCDTimer cancelTask:self.task];
}



@end
