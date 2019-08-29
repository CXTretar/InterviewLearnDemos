//
//  CXThreadManager.m
//  Runloop 处理子线程保活封装
//
//  Created by CXTretar on 2019/8/29.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "CXThreadManager.h"

// 自定义 NSThread 用来检测线程是否被销毁
@interface CXThread : NSThread

@end

@implementation CXThread

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end

@interface CXThreadManager()

@property(assign, nonatomic, getter=isStopped) BOOL stopped;
@property(nonatomic, strong) CXThread *innerThread;

@end

@implementation CXThreadManager

- (instancetype)init {
    if (self = [super init]) {
        
        [self startThread];
        
    }
    return self;
}

// 用于开启子线程的RunLoop用来保活
- (void)startThread {
    
    __weak typeof(self) weakSelf = self;
    self.stopped = NO;
    
    self.innerThread = [[CXThread alloc]initWithBlock:^{
        NSLog(@"%@----begin----", [NSThread currentThread]);
        
        // 往RunLoop里面添加Source\Timer\Observer
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        
        while (weakSelf && !weakSelf.isStopped) {  // 判断控制器是否已经销毁,已经销毁的控制器的 isStopped 为nil
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        NSLog(@"%@----end----", [NSThread currentThread]);
    }];
    
    [self.innerThread start];
}

// 用于停止子线程的RunLoop
- (void)stopThread {
    
    if (!self.innerThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

// 在子线程添加任务
- (void)executeThreadTask:(CXThreadTask)task {
    
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}


// 销毁时清除 thread
- (void)dealloc {
    
    NSLog(@"%s", __func__);
    [self stopThread];
}

#pragma mark - private methods
- (void)__stop {
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    self.innerThread = nil;
}

- (void)__executeTask:(CXThreadTask)task {
    task();
}

@end
