//
//  Person.m
//  autorelease 释放时机
//
//  Created by CXTretar on 2020/1/9.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    NSLog(@"%s", __func__);
    [super dealloc];
}


@end
