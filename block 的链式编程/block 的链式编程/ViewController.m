//
//  ViewController.m
//  block 的链式编程
//
//  Created by CXTretar on 2020/5/12.
//  Copyright © 2020 FPM. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+cx_makeConstraints.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger result = [NSObject cx_makeConstraints:^(CXConstraintMaker *make) {
        make.add(10).minus(5);
    }];
    NSLog(@"result = %ld", (long)result);
    // Do any additional setup after loading the view.
}


@end
