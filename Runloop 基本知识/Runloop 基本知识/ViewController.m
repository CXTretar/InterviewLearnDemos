//
//  ViewController.m
//  Runloop 基本知识
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // NSRunLoop 是在 CFRunLoop 外面包装了一层,实际是同一个 Runloop;
    /* Runloop mode 主要有
     kCFRunLoopDefaultMode   App的默认Mode，通常主线程是在这个Mode下运行
     UITrackingRunLoopMode   界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
     kCFRunLoopCommonModes   两者兼顾
     */
    
    NSLog(@"NSRunLoop - %p -- %p", [NSRunLoop currentRunLoop], [NSRunLoop mainRunLoop]);
    NSLog(@"CFRunLoop - %p -- %p", CFRunLoopGetCurrent(), CFRunLoopGetMain());
    
//    NSLog(@"[NSRunLoop currentRunLoop] -- %@", [NSRunLoop currentRunLoop]);
    
    [self addRunloopObserver1];
//    [self addRunloopObserver2];
}

// 添加Runloop的观察者,监听mode切换, 方式一
- (void)addRunloopObserver1 {
    
    /* Run Loop Observer Activities */
    /*
     typedef CF_OPTIONS(CFOptionFlags, CFRunLoopActivity) {
     kCFRunLoopEntry = (1UL << 0),              // 即将进入 Loop
     kCFRunLoopBeforeTimers = (1UL << 1),       // 即将处理 Timer
     kCFRunLoopBeforeSources = (1UL << 2),      // 即将处理 Source
     kCFRunLoopBeforeWaiting = (1UL << 5),      // 即将进入休眠
     kCFRunLoopAfterWaiting = (1UL << 6),       // 刚从休眠中唤醒
     kCFRunLoopExit = (1UL << 7),               // 即将退出 Loop
     kCFRunLoopAllActivities = 0x0FFFFFFFU
     };
     */
    
    // 创建Observer
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopEntry - %@", mode);
                CFRelease(mode);
                break;
            }
                
            case kCFRunLoopExit: {
                CFRunLoopMode mode = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
                NSLog(@"kCFRunLoopExit - %@", mode);
                CFRelease(mode);
                break;
            }
                
            default:
                break;
        }
    });
    
    // 添加Observer到RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    // 释放
    CFRelease(observer);
}

// 添加Runloop的观察者,监听mode切换, 方式二
void observeRunLoopActicities(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"kCFRunLoopBeforeTimers");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"kCFRunLoopBeforeSources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"kCFRunLoopBeforeWaiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"kCFRunLoopAfterWaiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");
            break;
        default:
            break;
    }
}

- (void)addRunloopObserver2 {
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, observeRunLoopActicities, NULL);
    
    // 添加Observer到RunLoop中
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    // 释放
    CFRelease(observer);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [NSTimer scheduledTimerWithTimeInterval:5.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"---定时器---");
    }];
}

@end
