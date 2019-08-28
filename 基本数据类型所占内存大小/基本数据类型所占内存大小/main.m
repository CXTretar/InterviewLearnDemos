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
        
        NSLog(@"int -- %zd", sizeof(int));                     // 4
        NSLog(@"float -- %zd", sizeof(float));                 // 4
        NSLog(@"double -- %zd", sizeof(double));               // 8
        NSLog(@"long -- %zd", sizeof(long));                   // 8
        NSLog(@"char -- %zd", sizeof(char));                   // 1
        NSLog(@"NSInteger -- %zd", sizeof(NSInteger));         // 8
        NSLog(@"NSUInteger -- %zd", sizeof(NSUInteger));       // 8
        NSLog(@"CGFloat -- %zd", sizeof(CGFloat));             // 8
        NSLog(@"BOOL -- %zd", sizeof(BOOL));                   // 1
        
        NSLog(@"指针 -- %zd -- %zd -- %zd", sizeof(int *), sizeof(char *), sizeof(void *)); // 8
    }
    return 0;
}
