//
//  Person.m
//  Category
//
//  Created by CXTretar on 2019/11/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"

@interface Person () {
    int _height;
}

@property(nonatomic, assign) int age;

- (void)run3;

@end

@implementation Person

- (void)run {
    NSLog(@"- Person - run");
}

+ (void)run2 {
    NSLog(@"+ Person - run2");
}

- (void)run3 {
    NSLog(@"- Person - run3");
}

@end
