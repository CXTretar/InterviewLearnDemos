//
//  ViewController.m
//  GCD 读写锁
//
//  Created by CXTretar on 2019/9/4.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@property(nonatomic, strong) dispatch_queue_t queue;
@property(nonatomic, assign) pthread_rwlock_t lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self GCDRWLock];
    [self pthreadRWLock];
    // Do any additional setup after loading the view.
}


// 使用 dispatch_barrier_async 生成读写锁
- (void)GCDRWLock {
    
    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(self.queue, ^{
            [self GCD_read];
        });
        
        dispatch_async(self.queue, ^{
            [self GCD_read];
        });
        
        dispatch_async(self.queue, ^{
            [self GCD_read];
        });
        
        dispatch_barrier_async(self.queue, ^{
            [self GCD_write];
        });
    }
}

- (void)GCD_read {
    sleep(1);
    NSLog(@"read");
}

- (void)GCD_write {
    sleep(1);
    NSLog(@"write");
}

// 使用 pthread_rwlock 生成读写锁
- (void)pthreadRWLock {
    
    // 初始化锁
    pthread_rwlock_init(&_lock, NULL);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self pthread_read];
        });
        
        dispatch_async(queue, ^{
            [self pthread_read];
        });
        
        dispatch_async(queue, ^{
            [self pthread_read];
        });
        
        dispatch_barrier_async(queue, ^{
            [self pthread_write];
        });
    }
}


- (void)pthread_read {
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)pthread_write {
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc {
    pthread_rwlock_destroy(&_lock);
}



@end
