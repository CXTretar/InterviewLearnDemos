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
    [self testArray];
    [self testDictionary];
    // Do any additional setup after loading the view.
}

- (void)testArray {
    NSMutableArray *array = [NSMutableArray array];
    id object = nil;
    NSString *name = @"felix";
    [array addObject:name];
    [array addObject:object];
    
    NSLog(@"%@", array);
}

- (void)testDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSString *object = nil;
    NSString *name = @"name";
    
    dict[name] = @"felix";
    dict[object] = @"123";
    
    NSLog(@"%@", dict);
    
    NSDictionary *dict2 = @{
                            @"name" : @"felix",
                            @"age" : @10
                            };
    NSString *value =  dict2[nil];
    
    NSLog(@"%@ -- %@", [dict class], value);
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
