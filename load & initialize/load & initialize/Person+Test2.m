//
//  Person+Test2.m
//  load & initialize
//
//  Created by CXTretar on 2019/11/5.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person+Test2.h"

@implementation Person (Test2)

+ (void)initialize {
    NSLog(@"%s", __func__);
}

//+ (void)load {
//    NSLog(@"%s", __func__);
//}

+ (void)test {
    NSLog(@"%s", __func__);
}

@end
