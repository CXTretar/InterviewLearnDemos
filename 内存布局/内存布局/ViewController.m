//
//  ViewController.m
//  内存布局
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


int a = 10;
int b;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    static int c = 20;
    
    static int d;
    
    int e;
    int f = 20;

    NSString *str = @"123";
    
    NSObject *obj = [[NSObject alloc] init];
    
    NSLog(@"\n&a=%p\n&b=%p\n&c=%p\n&d=%p\n&e=%p\n&f=%p\nstr=%p\nobj=%p\n",
          &a, &b, &c, &d, &e, &f, str, obj);
}


@end


/*
字符串常量
str=0x60000195c360            数据段

已初始化的全局变量、静态变量       数据段
&a=0x104ba7d18
&c=0x104ba7d1c

未初始化的全局变量、静态变量       数据段
&d=0x104ba7de0
&b=0x104ba7de4

堆 通过alloc、malloc、calloc等动态分配的空间，分配的内存空间地址越来越大
obj=0x60000195c360

栈 函数调用开销，比如局部变量。分配的内存空间地址越来越小
&e=0x7ffeeb0584ec
&f=0x7ffeeb0584e8
*/
