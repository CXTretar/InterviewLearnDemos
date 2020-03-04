//
//  ViewController.m
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "Person2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    person->_publicString = @"publicString";
    Student *student = [[Student alloc] init];
    student->_publicString = @"publicString";
    Person2 *person2 = [[Person2 alloc] init];
}


@end
