//
//  CXConstraintMaker.m
//  block 的链式编程
//
//  Created by CXTretar on 2020/3/12.
//  Copyright © 2020 FPM. All rights reserved.
//

#import "CXConstraintMaker.h"

@implementation CXConstraintMaker

- (CXConstraintMaker *(^)(NSInteger))add {
    return ^(NSInteger num){
        self.result += num;
        return self;
    };
}

- (CXConstraintMaker *(^)(NSInteger))minus {
    return ^(NSInteger num){
        self.result -= num;
        return self;
    };
}

@end
