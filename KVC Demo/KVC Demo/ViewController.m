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

@interface Student : NSObject

@property(nonatomic, copy) NSString *name;

@end

@implementation Student
@end

@interface Classes : NSObject

@property(nonatomic, strong) Student *student;

@end

@implementation Classes
@end

@interface School : NSObject

@property(nonatomic, strong) Classes *classes;

@end

@implementation School
@end

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
    [person setValue:@10 forKey:@"age"];
//     [person willChangeValueForKey:@"age"];
//     person->_age = 10;
//     [person didChangeValueForKey:@"age"];
    
    // 移除KVO监听
    [person removeObserver:observer forKeyPath:@"age"];
    // Do any additional setup after loading the view.
    
    
    School *school = [[School alloc] init];
    school.classes = [[Classes alloc] init];
    school.classes.student = [[Student alloc] init];
    
    [school setValue:@"jack" forKeyPath:@"classes.student.name"];
    NSLog(@"school -- %@", [school valueForKeyPath:@"classes.student.name"]);
}

- (void)dealloc {
    
}


@end
