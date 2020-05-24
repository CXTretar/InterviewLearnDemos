//
//  ViewController.m
//  KVO Demo
//
//  Created by CXTretar on 2019/9/8.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property(nonatomic, strong) Person *person1;
@property(nonatomic, strong) Person *person2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person1 = [[Person alloc] init];
    self.person1.age = 1;
    self.person1.name = @"Jack";
    self.person1->_phone = @"123456";
    
    self.person2 = [[Person alloc] init];
    self.person2.age = 2;
    self.person2.name = @"Rose";
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    [self.person1 addObserver:self forKeyPath:@"name" options:options context:@"456"];
    [self.person1 addObserver:self forKeyPath:@"phone" options:options context:@"789"];
    NSLog(@"新的子类 %@", object_getClass(self.person1));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    self.person1.age = 20;
    self.person2.age = 50;
    
    self.person1.name = @"Felix";
    self.person2.name = @"Mike";
    
    //手动发通知
    //即将改变(发一次通知)
    [self.person1 willChangeValueForKey:@"phone"];
    self.person1->_phone = @"123456";
     //已经改变(发一次通知),一共发了两次通知
    [self.person1 didChangeValueForKey:@"phone"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
    [self.person1 removeObserver:self forKeyPath:@"name"];
    
}


@end
