//
//  Person.h
//  block循环引用的处理方法
//
//  Created by CXTretar on 2019/12/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, assign) int age;

@property(nonatomic, copy) void(^block)(void);

@end
