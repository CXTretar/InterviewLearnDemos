//
//  CXThreadManager.m
//  Runloop 处理子线程保活封装优化
//
//  Created by CXTretar on 2019/8/30.
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

    self.innerThread = [[CXThread alloc]initWithBlock:^{
        NSLog(@"%@----begin----", [NSThread currentThread]);
        
        // 创建上下文（要初始化一下结构体）
        CFRunLoopSourceContext context = {0};
        
        // 创建source
        CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
        
        // 往Runloop中添加source
        CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
        
        // 销毁source
        CFRelease(source);
        
        // 启动
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        
      
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
   
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    self.innerThread = nil;
}

- (void)__executeTask:(CXThreadTask)task {
    task();
}

@end

