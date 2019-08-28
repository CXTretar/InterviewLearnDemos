//
//  ViewController.m
//  runtime 方法交换的运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)click1:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)click2:(id)sender {
    NSLog(@"%s", __func__);
}

- (IBAction)click3:(id)sender {
    NSLog(@"%s", __func__);
}



@end
