//
//  NSObject+cx_makeConstraints.m
//  block 的链式编程
//
//  Created by CXTretar on 2020/3/12.
//  Copyright © 2020 FPM. All rights reserved.
//

#import "NSObject+cx_makeConstraints.h"

@implementation NSObject (cx_makeConstraints)

+ (NSInteger)cx_makeConstraints:(void(^)(CXConstraintMaker *make))block {
    CXConstraintMaker *make = [[CXConstraintMaker alloc] init];
    block(make);         // 调用 make 的 block, make 本身作为该 block 的参数
    return make.result;  // 返回运算结果
}

@end
