//
//  main.m
//  block 的类型
//
//  Created by CXTretar on 2019/12/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // __NSGlobalBlock__ : __NSGlobalBlock__ : __NSBlock :
        // Global 没有访问auto变量,放在数据段
        void (^block1)(void) = ^{
            NSLog(@"Hello World!");
        };
        
        NSLog(@"block1 -- %@ -- %@ -- %@ -- %@",
              [block1 class],
              [[block1 class] superclass],
              [[[block1 class] superclass] superclass],
              [[[[block1 class] superclass] superclass] superclass]
              );
        // Malloc 访问auto变量,但是有强引用,放在堆段
        int age = 15;
        void (^block2)(void) = ^{
            NSLog(@"block2 - %d", age);
        };
        
        NSLog(@"block2 -- %@ -- %@ -- %@ -- %@",
              [block2 class],
              [[block2 class] superclass],
              [[[block2 class] superclass] superclass],
              [[[[block2 class] superclass] superclass] superclass]
              );
        
        // Global 没有访问auto变量,访问静态变量,放在数据段
        static int weight = 70;
        void (^block3)(void) = ^{
            NSLog(@"block3 - %d", weight);
        };
        
        NSLog(@"block3 -- %@ -- %@ -- %@ -- %@",
              [block3 class],
              [[block3 class] superclass],
              [[[block3 class] superclass] superclass],
              [[[[block3 class] superclass] superclass] superclass]
              );
        // Stack 访问auto变量,但是没有强引用,放在栈段
        NSLog(@"block4 -- %@",
              [^{
            NSLog(@"block4 - %d", age);
        } class]);
        
        // Malloc Stack访问auto变量,但是没有强引用,使用了copy,就会变成Malloc, 放在堆段
        NSLog(@"block5 -- %@",
              [[^{
            NSLog(@"block5 - %d", age);
        } copy] class]);
        
        /** copy 之后的效果
         Global -----> 无效果
         Stack  -----> 复制到堆上
         Malloc -----> 引用计数器+1
         */
    }
    return 0;
}

