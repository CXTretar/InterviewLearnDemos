//
//  NSObject+JSON.m
//  runtime 的项目运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "NSObject+JSON.h"
#import <objc/runtime.h>

@implementation NSObject (JSON)

+ (instancetype)cx_objectWithJson:(NSDictionary *)json {
    
    id object = [[self alloc] init];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0; i < count; i++) {
        // 取出i位置的成员变量
        Ivar ivar = ivars[i];
        NSMutableString *key = [NSMutableString stringWithUTF8String:ivar_getName(ivar)]; // 取出变量名类似 _name
        [key deleteCharactersInRange:NSMakeRange(0, 1)]; // 去除 _ , 变成 name
        
        // 设值
        id value = json[key];
        if ([key isEqualToString:@"ID"]) {  // 对 id 变量名特殊处理
            value = json[@"id"];
        }
        if (value) [object setValue:value forKey:key]; // 判断 value 是否为nil, 不为空则设置
       
    }
    free(ivars);
    
    return object;
}


@end
