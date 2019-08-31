//
//  ViewController.m
//  GCD 打印面试题
//
//  Created by CXTretar on 2019/8/31.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self question1];
    //    [self question2];
//    [self deadlock1];
//    [self deadlock2];
    [self deadlock3];
    // Do any additional setup after loading the view.
}

- (void)test {
    NSLog(@"2");
}

- (void)question1 {
    // dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
    /* long identifier：ios 8.0 告诉队列执行任务的“服务质量 quality of service”，系统提供的参数有：
     QOS_CLASS_USER_INTERACTIVE 0x21,              用户交互(希望尽快完成，用户对结果很期望，不要放太耗时操作)
     QOS_CLASS_USER_INITIATED 0x19,                用户期望(不要放太耗时操作)
     QOS_CLASS_DEFAULT 0x15,                        默认(不是给程序员使用的，用来重置对列使用的)
     QOS_CLASS_UTILITY 0x11,                        实用工具(耗时操作，可以使用这个选项)
     QOS_CLASS_BACKGROUND 0x09,                     后台
     QOS_CLASS_UNSPECIFIED 0x00,                    未指定
     iOS 7.0 之前 优先级
     DISPATCH_QUEUE_PRIORITY_HIGH 2                 高优先级
     DISPATCH_QUEUE_PRIORITY_DEFAULT 0              默认优先级
     DISPATCH_QUEUE_PRIORITY_LOW (-2)               低优先级
     DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN  后台优先级
     BACKGROUND表示用户不需要知道任务什么时候完成，如果选择这个选项速度慢得令人发指，非常不利于调试！对于优先级推荐不要搞得太负责，就用最简单，以免发生优先级反转。
     
     unsigned long flags：苹果官方文档是这样解释的： Flags that are reserved for future use。标记是为了未来使用保留的！所以这个参数应该永远指定为0
     */
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        
        [self performSelector:@selector(test) withObject:nil afterDelay:0];
        
        NSLog(@"3");
    });
    
    /*
     打印结果是：1、3
     原因
     performSelector:withObject:afterDelay:的本质是往Runloop中添加定时器
     子线程默认没有启动Runloop, 所以没法添加
     */
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc]initWithBlock:^{
        NSLog(@"1");
        
        //        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        //        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
    }];
    [thread start];
    
    [self performSelector:@selector(test) withObject:nil afterDelay:0];
    
    NSLog(@"3");
    /*
     打印结果是：3、1、2 或者 3、2、1
     原因
     performSelector NSThread 有延时,  主线程先打印, performSelector NSThread 顺序不确定
     */
}

// 异步并发线程组
- (void)question2 {
    // 创建队列组
    dispatch_group_t group = dispatch_group_create();
    // 创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    // 添加异步任务
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务1-%@", [NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务2-%@", [NSThread currentThread]);
        }
    });
    
    // 等前面的任务执行完毕后，会自动执行这个任务
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"任务3-%@", [NSThread currentThread]);
        }
    });
}

// 线程死锁 使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列（产生死锁,这里队列中已经有viewDidLoad 这个方法在执行
- (void)deadlock1 {
    NSLog(@"----- begin ----- ");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        NSLog(@"----- run ----- ");
    });
    
    NSLog(@"----- end ----- ");
}

- (void)deadlock2 {
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        NSLog(@"----- begin ----- ");
        
        dispatch_sync(queue, ^{
            NSLog(@"----- run ----- ");
        });
        
        NSLog(@"----- end ----- ");
    });

}

// 一定要注意是(当前)串行队列中添加任务, 非当前串行队列中添加任务不会死锁
- (void)deadlock3 {
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    NSLog(@"----- begin ----- ");
    
    dispatch_sync(queue, ^{
        NSLog(@"----- run ----- ");
    });
    
    NSLog(@"----- end ----- ");
}





@end
