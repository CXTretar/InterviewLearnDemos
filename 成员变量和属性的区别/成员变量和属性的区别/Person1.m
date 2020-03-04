//
//  Person1.m
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person1.h"

@interface Person1() {
    // 1.声明成员变量
     NSString *name;
}
// 2.声明属性
@property (nonatomic, copy) NSString *name;

@end

@implementation Person1
  
// 3.最后在@implementation中用synthesize生成set方法
@synthesize name;

- (instancetype)init {
    if (self = [super init]) {
        
        self.name = @"Jack";
    }
    
    return self;
}

@end


