//
//  Person+Test.m
//  关联对象
//
//  Created by CXTretar on 2019/11/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person+Test.h"
#import <objc/runtime.h>

@implementation Person (Test)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
   return objc_getAssociatedObject(self, @selector(name));
}

- (void)setHeight:(float)height {
    objc_setAssociatedObject(self, @selector(height), @(height), OBJC_ASSOCIATION_ASSIGN);
}

- (float)height {
    return [objc_getAssociatedObject(self, @selector(height)) floatValue];
}

@end
