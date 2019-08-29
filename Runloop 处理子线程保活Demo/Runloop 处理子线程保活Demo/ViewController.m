//
//  ViewController.m
//  Runloop 处理子线程保活Demo
//
//  Created by CXTretar on 2019/8/29.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "CXThread.h"

@interface ViewController ()

@property(assign, nonatomic, getter=isStopped) BOOL stopped;
@property(nonatomic, strong) CXThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startThread];
    //s Do any additional setup after loading the view.
}

// 用于开启子线程的RunLoop用来保活
- (void)startThread {
    
     __weak typeof(self) weakSelf = self;
    self.stopped = NO;
    
    self.thread = [[CXThread alloc]initWithBlock:^{
        NSLog(@"%@----begin----", [NSThread currentThread]);
        
        // 往RunLoop里面添加Source\Timer\Observer
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        
        while (weakSelf && !weakSelf.isStopped) {  // 判断控制器是否已经销毁,已经销毁的控制器的 isStopped 为nil
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        NSLog(@"%@----end----", [NSThread currentThread]);
    }];
    
    [self.thread start];
}

// 用于停止子线程的RunLoop
- (void)stopThread {
    // 设置标记为NO
    self.stopped = YES;
    
    // 停止RunLoop
    CFRunLoopStop(CFRunLoopGetCurrent());
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    
    // 清空线程
    self.thread = nil;
}

- (IBAction)stop:(id)sender {
     if (!self.thread) return; // 判断子线程是否已经停止,已经停止的子线程无法添加任务
    // 在子线程调用stop
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.thread) return; // 判断子线程是否已经停止,已经停止的子线程无法添加任务
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}

// 子线程需要执行的任务
- (void)test {
    NSLog(@"测试任务 %s %@", __func__, [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop:nil];
}

@end
