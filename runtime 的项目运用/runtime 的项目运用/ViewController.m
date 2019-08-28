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
#import "NSObject+JSON.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

void eat(id self, SEL _cmd) {
    NSLog(@"_____ %@ - %@", self, NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testClass];
    [self testIvars];
    [self testPlaceholder];
    [self testJSON];
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


// 在成员变量 Ivar 方面的运用
- (void)testIvars {
    // 获取成员变量信息
    Ivar nameIvar = class_getInstanceVariable([Person class], "_name");
    Ivar ageIvar = class_getInstanceVariable([Person class], "_age");
    Ivar weightIvar = class_getInstanceVariable([Person class], "_weight");
    
    NSLog(@"weightIvar - %s - %s", ivar_getName(weightIvar), ivar_getTypeEncoding(weightIvar));
    NSLog(@"nameIvar - %s - %s", ivar_getName(nameIvar), ivar_getTypeEncoding(nameIvar));
    
    // 设置成员变量的值
    Person *person = [[Person alloc]init];
    object_setIvar(person, nameIvar, @"张三");
    object_setIvar(person, ageIvar, (__bridge id)(void *)12);
    [person setValue:@175.0 forKey:@"_weight"];
    NSLog(@"name - %@  age - %d  weight - %f", person.name, person.age, person.weight);
    
    // 成员变量的数量
    unsigned int count;
    Ivar *ivars = class_copyIvarList([Person class], &count);
    for (int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSLog(@"%s - %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    free(ivars); // copy create 创建的需要free
}

// 利用 textField 的 ivars 属性列表对placeholder定制
- (void)testPlaceholder {
    
    //    unsigned int count;
    //    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    //    for (int i = 0; i < count; i++) {
    //        // 取出i位置的成员变量
    //        Ivar ivar = ivars[i];
    //        NSLog(@"%s - %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    //    }
    //    free(ivars); // copy create 创建的需要free
    // 找到   _placeholderLabel - @"UITextFieldLabel" 这个ivar, 猜测 UITextFieldLabel 是 UILabel 的子类
    
    self.textField.placeholder = @"请输入用户名";
    // 1. 通过kvc修改
    [self.textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    // 2. 通过UILabel修改
    UILabel *placeholderLabel = [self.textField valueForKeyPath:@"_placeholderLabel"];
    placeholderLabel.textColor = [UIColor redColor];
    
    // 3. 通过富文本修改
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    self.textField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"请输入用户名" attributes:attrs];
}

- (void)testJSON {
    NSDictionary *json = @{
                           @"name" : @"张三",
                           @"age" : @10,
                           @"weight" : @175.5,
                           };
    Person *person = [Person cx_objectWithJson:json];
    NSLog(@"%@ --- %d --- %f" , person.name, person.age, person.weight);
}

@end
