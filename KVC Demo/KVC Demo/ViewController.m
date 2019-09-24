//
//  ViewController.m
//  KVC Demo
//
//  Created by CXTretar on 2019/9/24.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Observer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Observer *observer = [[Observer alloc] init];
    Person *person = [[Person alloc] init];
    
    // 添加KVO监听
    [person addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
    
    // 通过KVC修改age属性
//    [person setValue:@10 forKey:@"age"];
     [person willChangeValueForKey:@"age"];
     person->_age = 10;
     [person didChangeValueForKey:@"age"];
    
    // 移除KVO监听
    [person removeObserver:observer forKeyPath:@"age"];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    
}


@end
