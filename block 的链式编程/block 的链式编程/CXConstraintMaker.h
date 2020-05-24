//
//  CXConstraintMaker.h
//  block 的链式编程
//
//  Created by CXTretar on 2020/3/12.
//  Copyright © 2020 FPM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXConstraintMaker : NSObject

// 结果
@property(nonatomic, assign) NSInteger result;

// 返回值为 CXConstraintMaker *(^block)(NSInteger) 的方法
// 而 block 自身的返回值为这个类的本身，参数类型为 NSInteger
- (CXConstraintMaker *(^)(NSInteger))add;
- (CXConstraintMaker *(^)(NSInteger))minus;

@end


