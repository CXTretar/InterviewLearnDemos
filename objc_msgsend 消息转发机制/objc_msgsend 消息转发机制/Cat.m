//
//  Cat.m
//  objc_msgsend 消息转发机制
//
//  Created by CXTretar on 2019/8/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Cat.h"

@implementation Cat

- (void)instanceMethod {
    NSLog(@"%s", __func__);
}

+ (void)classMethod {
    NSLog(@"%s", __func__);
}

@end
