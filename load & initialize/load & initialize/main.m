//
//  main.m
//  load & initialize
//
//  Created by CXTretar on 2019/11/5.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

void printMethodNamesOfClass(Class cls) {
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ - %@", cls, methodNames);
}

/**
 +load方法会在runtime加载类、分类时调用
 每个类、分类的+load，在程序运行过程中只调用一次

 先调用类的+load
 按照编译先后顺序调用（先编译，先调用）
 调用子类的+load之前会先调用父类的+load
 
 再调用分类的+load
 按照编译先后顺序调用（先编译，先调用）

 +initialize方法会在类第一次接收到消息时调用
 
 先调用父类的+initialize，再调用子类的+initialize
 (先初始化父类，再初始化子类，每个类只会初始化1次)

 +initialize和+load的很大区别是，+initialize是通过objc_msgSend进行调用的，所以有以下特点
 如果子类没有实现+initialize，会调用父类的+initialize（所以父类的+initialize可能会被调用多次）
 如果分类实现了+initialize，就覆盖类本身的+initialize调用

 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@" ------------------- ");
        [Person test];
        [Student test];
        [Teacher test];
        NSLog(@" ------------------- ");
        printMethodNamesOfClass(object_getClass([Person class]));
    }
    return 0;
}
