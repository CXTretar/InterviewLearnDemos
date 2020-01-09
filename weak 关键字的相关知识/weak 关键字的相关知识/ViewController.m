//
//  ViewController.m
//  weak 关键字的相关知识
//
//  Created by CXTretar on 2020/1/9.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __strong            Person *person1;
    __weak              Person *person2;
    __unsafe_unretained Person *person3;
    
    NSLog(@"---- begin ----");
    
    {
        Person *person4 = [[Person alloc] init];
        Person *person5 = [[Person alloc] init];
        Person *person6 = [[Person alloc] init];
        
        person1 = person4;
        person2 = person5;
        person3 = person6;
        
    }
    
    NSLog(@"---- end ----");
    NSLog(@"person1 %@ %p", person1, person1);
    NSLog(@"person2 %@ %p", person2, person2);
    NSLog(@"person3 %@ %p", person3, person3);
}


@end
