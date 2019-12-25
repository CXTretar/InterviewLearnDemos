//
//  Person.m
//  block循环引用的处理方法
//
//  Created by CXTretar on 2019/12/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
