//
//  Person.m
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person.h"

@interface Person() {
    int _phoneNum;
    NSString *_address;
    
@public
    int _age;
    NSString *_extensionString;
}

@property (nonatomic, copy) NSString *name;

@end

@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        
        self->_extensionString = @"_extensionString";
        
    }
    return self;
}

@end
