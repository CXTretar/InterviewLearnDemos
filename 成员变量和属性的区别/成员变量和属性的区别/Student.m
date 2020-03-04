//
//  Student.m
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init {
    if (self = [super init]) {
        
        self->_phone = 1231245455;
    }
    return self;
}

@end
