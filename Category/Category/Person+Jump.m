//
//  Person+Jump.m
//  Category
//
//  Created by CXTretar on 2019/11/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person+Jump.h"


@implementation Person (Jump)

- (void)run {
    NSLog(@"Person (Jump) - run");
}


- (void)jump {
    NSLog(@"- Person - jump");
}

+ (void)jump2 {
    NSLog(@"+ Person - jump");
}


@end

/**
 结构
 struct _category_t {
     const char *name;
     struct _class_t *cls;
     const struct _method_list_t *instance_methods;
     const struct _method_list_t *class_methods;
     const struct _protocol_list_t *protocols;
     const struct _prop_list_t *properties;
 };
 
 赋值
 static struct _category_t _OBJC_$_CATEGORY_Person_$_Jump __attribute__ ((used, section ("__DATA,__objc_const"))) =
 {
     "Person",
     0, // &OBJC_CLASS_$_Person,
     (const struct _method_list_t *)&_OBJC_$_CATEGORY_INSTANCE_METHODS_Person_$_Jump,
     (const struct _method_list_t *)&_OBJC_$_CATEGORY_CLASS_METHODS_Person_$_Jump,
     0,
     0,
 };
 
 */
