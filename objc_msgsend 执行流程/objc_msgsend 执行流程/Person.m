//
//  Person.m
//  objc_msgsend 执行流程
//
//  Created by CXTretar on 2019/8/24.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)objectMethod {
    
    NSLog(@"%s", __func__);
    
}

+ (void)classMethod {

    NSLog(@"%s", __func__);
}

@end
