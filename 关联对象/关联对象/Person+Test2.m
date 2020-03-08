//
//  Person+Test2.m
//  关联对象
//
//  Created by CXTretar on 2020/3/5.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person+Test2.h"

@implementation Person (Test2)

NSMutableDictionary *weights;
NSMutableDictionary *nickNames;

+ (void)load {
    weights = [NSMutableDictionary dictionary];
    nickNames = [NSMutableDictionary dictionary];
}

- (void)setWeight:(float)weight {
    
    NSString *key = [NSString stringWithFormat:@"%p", self];
    weights[key] = @(weight);
}

- (float)weight {
    NSString *key = [NSString stringWithFormat:@"%p", self];
    return [weights[key] floatValue];
}

- (void)setNickName:(NSString *)nickName {
    NSString *key = [NSString stringWithFormat:@"%p", self];
    nickNames[key] = nickName;
}

- (NSString *)nickName {
    NSString *key = [NSString stringWithFormat:@"%p", self];
    return nickNames[key];
}

@end
