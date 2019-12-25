//
//  main.m
//  block的变量捕捉
//
//  Created by CXTretar on 2019/11/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

int age_ = 10; // 全局静态变量, 直接获取值不捕获,直接访问,不捕获,直接访问
static int height_ = 10; // 全局静态变量, 直接获取值,不捕获,直接访问

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int weight = 10; // 直接捕获值(值传递) auto 自动变量,离开作用域自动销毁
        static NSString *name = @"jack"; // 捕获指针(指针传递) static 静态变量
        void (^block)(void) = ^{
            NSLog(@"name is %@, age is %d, height is %d, weight is %d", name, age_, height_, weight);
        };
        
        age_ = 20;
        height_ = 20;
        weight = 20;
        name = @"rose";
        
        block();
        
        NSLog(@"%@", [block class]);
    }
    return 0;
}
