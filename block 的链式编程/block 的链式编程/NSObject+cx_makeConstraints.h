//
//  NSObject+cx_makeConstraints.h
//  block 的链式编程
//
//  Created by CXTretar on 2020/3/12.
//  Copyright © 2020 FPM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CXConstraintMaker.h"

@interface NSObject (cx_makeConstraints)

// 传入值为 block，返回值为 NSInteger 的类方法
// block的返回值为空, block的参数为 CXConstraintMaker *make
+ (NSInteger)cx_makeConstraints:(void(^)(CXConstraintMaker *make))block;

@end

