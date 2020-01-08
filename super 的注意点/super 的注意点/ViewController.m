//
//  ViewController.m
//  super 的注意点
//
//  Created by CXTretar on 2019/8/27.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
//    NSObject *obj2 = [[NSObject alloc] init];
//
//    NSString *test = @"123";
    
    id cls = [Person class];
    
    void *obj = &cls;
    
    [(__bridge id)obj print];
    
    Person *person = [[Person alloc]init];
    [person print];
    
    /*
     cls == person 对象中的 isa 存放的地址,指向 Person 类对象
     obj == person 对象地址,指向 isa 地址
     test 或者 obj2 或者 ViewController == _name 所在地址内容
      */
}

- (void)test {
    // 局部变量放在栈空间,内存地址 高 -> 低
    long long a = 4; // 0x7ffee6efe818
    long long b = 5; // 0x7ffee6efe810
    long long c = 6; // 0x7ffee6efe808
    long long d = 7; // 0x7ffee6efe800
    
    NSLog(@"%p %p %p %p", &a, &b, &c, &d);
}



@end
