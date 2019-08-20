//
//  main.m
//  基本数据类型所占内存大小
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 常见基本数据类型
        // int、float、double、long、char、NSInteger、NSUInteger、CGFloat、BOOL
        
        NSLog(@"int -- %zd", sizeof(int));
        NSLog(@"float -- %zd", sizeof(float));
        NSLog(@"double -- %zd", sizeof(double));
        NSLog(@"long -- %zd", sizeof(long));
        NSLog(@"char -- %zd", sizeof(char));
        NSLog(@"NSInteger -- %zd", sizeof(NSInteger));
        NSLog(@"NSUInteger -- %zd", sizeof(NSUInteger));
        NSLog(@"CGFloat -- %zd", sizeof(CGFloat));
        NSLog(@"BOOL -- %zd", sizeof(BOOL));
        
        NSLog(@"指针 -- %zd -- %zd -- %zd", sizeof(int *), sizeof(char *), sizeof(void *));
    }
    return 0;
}
