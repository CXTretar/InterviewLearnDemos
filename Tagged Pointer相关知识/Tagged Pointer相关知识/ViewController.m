//
//  ViewController.m
//  Tagged Pointer相关知识
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *name1;
@property (nonatomic, copy) NSString *name2;

@end

// 判断 NSNumber 是不是一个 Tagged Pointer
/*
#if TARGET_OS_OSX && __x86_64__
# define OBJC_MSB_TAGGED_POINTERS 0
#else
# define OBJC_MSB_TAGGED_POINTERS 1
#endif

#if OBJC_MSB_TAGGED_POINTERS
# define _OBJC_TAG_MASK (1UL<<63)   iOS 平台以及模拟器
#else
# define _OBJC_TAG_MASK (1UL)       macOS 平台
#endif
*/

# define _OBJC_TAG_MASK (1UL<<63)

BOOL isTaggedPointer(id pointer) {
   
    return ((long)(__bridge void *)pointer & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}

@implementation ViewController

/**
 Tagged Pointer
 
 从64bit开始，iOS引入了Tagged Pointer技术，用于优化NSNumber、NSDate、NSString等小对象的存储
 
 在没有使用Tagged Pointer之前， NSNumber等对象需要动态分配内存、维护引用计数等，NSNumber指针存储的是堆中NSNumber对象的地址值
 
 使用Tagged Pointer之后，NSNumber指针里面存储的数据变成了：Tag + Data，也就是将数据直接存储在了指针中
 
 当指针不够存储数据时，才会使用动态分配内存的方式来存储数据
 
 objc_msgSend能识别Tagged Pointer，比如NSNumber的intValue方法，直接从指针提取数据，节省了以前的调用开销
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *number1 = @1;
    NSNumber *number2 = @2;
    NSNumber *number3 = @(0xFFFFFFFFFFFFFFFF);
    NSLog(@"\n %p \n %p \n %p \n", number1, number2, number3);
    NSLog(@"%d %d %d", isTaggedPointer(number1), isTaggedPointer(number2), isTaggedPointer(number3));
//    [self test1]; // 会崩溃,坏内存访问
    [self test2];
}

- (void)test1 {
    NSLog(@"---- test1 ----");
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            // 必需加锁因为通过消息机制修改值
            // 加锁
            self.name1 = [NSString stringWithFormat:@"abcdefghijk"];
            // 解锁
        });
    }
    
    NSLog(@"%@ -- %p", self.name1, self.name1);
}

- (void)test2 {
    NSLog(@"---- test2 ----");
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            // 无需加锁因为不是oc对象不通过消息机制修改值,通过指针修改值
            self.name2 = [NSString stringWithFormat:@"abc"];

        });
    }
    
    NSLog(@"%@ -- %p -- %d", self.name2, self.name2, isTaggedPointer(self.name2));
    NSLog(@"%d -- %d -- %d", 'a', 'b', 'c');
    self.name1 = [NSString stringWithFormat:@"abcdefghijk"];
    NSLog(@"%@ -- %p -- %d", self.name1, self.name1, isTaggedPointer(self.name1));
}
 


@end
