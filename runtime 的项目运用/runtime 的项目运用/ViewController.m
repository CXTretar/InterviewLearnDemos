//
//  ViewController.m
//  runtime 的项目运用
//
//  Created by CXTretar on 2019/8/27.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Cat.h"

@interface ViewController ()

@end

@implementation ViewController

void eat(id self, SEL _cmd) {
    NSLog(@"_____ %@ - %@", self, NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testClass];
    // Do any additional setup after loading the view.
}

// 在 Class 方面的运用
- (void)testClass {
    Person *person = [[Person alloc]init];
    [person eat];
    
    object_setClass(person, [Cat class]);
    [person eat];
    
    // 获取isa指向的Class
    NSLog(@"object_getClass(person) - %@", object_getClass(person));
    NSLog(@"object_getClass([Person class]) - %@", object_getClass([Person class]));
    NSLog(@"object_getClass([Person superclass]) - %@", object_getClass([Person superclass]));
    
    // 判断一个OC对象是否为Class
    NSLog(@"object_isClass(person) - %d", object_isClass(person));                   // 0
    NSLog(@"object_isClass([Person class]) - %d", object_isClass([Person class]));           // 1
    
    // 判断一个Class对象是否为元类
    NSLog(@"class_isMetaClass([Person class]) - %d", class_isMetaClass([Person class]));                    // 0
    NSLog(@"class_isMetaClass([Person superclass]) - %d", class_isMetaClass([Person superclass]));               // 0
    NSLog(@"class_isMetaClass(object_getClass([Person class])) - %d", class_isMetaClass(object_getClass([Person class])));   // 1
    
    // 动态创建一个类（参数：父类，类名，额外的内存空间）
    Class Dog = objc_allocateClassPair([NSObject class], "Dog", 0);
    // 动态添加成员变量（已经注册的类是不能动态添加成员变量的）
    class_addIvar(Dog, "_weight", 4, 1, @encode(int));
    class_addIvar(Dog, "_height", 4, 1, @encode(float));
    //动态添加方法
    class_addMethod(Dog, @selector(eat), (IMP)eat, "v@:");
    // 注册类
    objc_registerClassPair(Dog);
    // 新创建类的使用
    id dog = [[Dog alloc] init];
    [dog setValue:@10 forKey:@"_weight"];
    [dog setValue:@20 forKey:@"_height"];
    [dog eat];

    // 在不需要这个类时释放, 释放前一定要保证基于这个类创建的对象被销毁!!!.
    dog = nil;
    objc_disposeClassPair(Dog);
}



@end
