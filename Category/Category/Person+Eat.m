//
//  Person+Eat.m
//  Category
//
//  Created by CXTretar on 2019/11/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person+Eat.h"



@implementation Person (Eat)

- (void)run {
    NSLog(@"Person (Eat) - run");
}


- (void)eat {
    NSLog(@"- Person - eat");
}

+ (void)eat2 {
    NSLog(@"+ Person - eat2");
}

@end

/*
 
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
static struct _category_t _OBJC_$_CATEGORY_Person_$_Eat __attribute__ ((used, section ("__DATA,__objc_const"))) =
{
    "Person",
    0, // &OBJC_CLASS_$_Person,
    (const struct _method_list_t *)&_OBJC_$_CATEGORY_INSTANCE_METHODS_Person_$_Eat,
    (const struct _method_list_t *)&_OBJC_$_CATEGORY_CLASS_METHODS_Person_$_Eat,
    (const struct _protocol_list_t *)&_OBJC_CATEGORY_PROTOCOLS_$_Person_$_Eat,
    (const struct _prop_list_t *)&_OBJC_$_PROP_LIST_Person_$_Eat,
};

属性列表赋值
static struct (_prop_list_t) {
    unsigned int entsize;  // sizeof(struct _prop_t)
    unsigned int count_of_properties;
    struct _prop_t prop_list[2];
} _OBJC_$_PROP_LIST_Person_$_Eat __attribute__ ((used, section ("__DATA,__objc_const"))) = {
    sizeof(_prop_t),
    2,
    {{"weight","Ti,N"},
    {"height","Td,N"}}
};

协议列表赋值
static struct (_protocol_list_t) {
    long protocol_count;  // Note, this is 32/64 bit
    struct _protocol_t *super_protocols[2];
} _OBJC_CATEGORY_PROTOCOLS_$_Person_$_Eat __attribute__ ((used, section ("__DATA,__objc_const"))) = {
    2,
    &_OBJC_PROTOCOL_NSCopying,
    &_OBJC_PROTOCOL_NSCoding
};

方法列表赋值
static struct (_method_list_t) {
    unsigned int entsize;  // sizeof(struct _objc_method)
    unsigned int method_count;
    struct _objc_method method_list[2];
} _OBJC_$_CATEGORY_INSTANCE_METHODS_Person_$_Eat __attribute__ ((used, section ("__DATA,__objc_const"))) = {
    sizeof(_objc_method),
    2,
    {{(struct objc_selector *)"run", "v16@0:8", (void *)_I_Person_Eat_run},
    {(struct objc_selector *)"eat", "v16@0:8", (void *)_I_Person_Eat_eat}}
};

static struct (_method_list_t) {
    unsigned int entsize;  // sizeof(struct _objc_method)
    unsigned int method_count;
    struct _objc_method method_list[1];
} _OBJC_$_CATEGORY_CLASS_METHODS_Person_$_Eat __attribute__ ((used, section ("__DATA,__objc_const"))) = {
    sizeof(_objc_method),
    1,
    {{(struct objc_selector *)"eat2", "v16@0:8", (void *)_C_Person_Eat_eat2}}
};

*/


