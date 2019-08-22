//
//  ViewController.m
//  位运算实现枚举类型
//
//  Created by CXTretar on 2019/8/22.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "ViewController.h"

//typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
//};

typedef NS_OPTIONS(NSUInteger, ExampleOption) {
    ExampleOptionNone   = 0,       // 0b0000 0000
    ExampleOptionOne    = 1 << 0,  // 0b0000 0001
    ExampleOptionTwo    = 1 << 1,  // 0b0000 0010
    ExampleOptionThree  = 1 << 2,  // 0b0000 0100
    ExampleOptionFour   = 1 << 3,  // 0b0000 1000
    ExampleOptionFive   = 1 << 4,  // 0b0001 0000
    ExampleOptionSix    = 1 << 5   // 0b0010 0000
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    
    [self setOptions: ExampleOptionSix | ExampleOptionThree];
    // Do any additional setup after loading the view.
}

- (void)setOptions:(ExampleOption)options {
    if (options & ExampleOptionOne) {
        NSLog(@"包含了ExampleOptionOne");
    }
    
    if (options & ExampleOptionTwo) {
        NSLog(@"包含了ExampleOptionTwo");
    }
    
    if (options & ExampleOptionThree) {
        NSLog(@"包含了ExampleOptionFour");
    }
    
    if (options & ExampleOptionFour) {
        NSLog(@"包含了ExampleOptionFour");
    }
    
    if (options & ExampleOptionFive) {
        NSLog(@"包含了ExampleOptionFive");
    }
    
    if (options & ExampleOptionSix) {
        NSLog(@"包含了ExampleOptionSix");
    }
}


@end
