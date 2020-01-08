//
//  ViewController.m
//  CADisplayLink 定时器
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "CXProxy.h"

@interface ViewController ()

@property(nonatomic, strong) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 保证调用频率和屏幕的刷帧频率一致，60FPS
}

- (IBAction)startTimer:(id)sender {
    self.link = [CADisplayLink displayLinkWithTarget:[CXProxy proxyWithTarget:self] selector:@selector(timerTest)];
       [self.link  addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)timerTest {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    [self.link invalidate];
}


@end
