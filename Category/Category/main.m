//
//  main.m
//  Category
//
//  Created by CXTretar on 2019/11/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Eat.h"
#import "Person+Jump.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
//        person.name = @"jack";
        [person run];
//        objc_msgSend(person, @selector(run));
        [person jump];
        [person eat];
//        objc_msgSend(person, @selector(eat));
        
        // 通过runtime动态将分类的方法合并到类对象、元类对象中
        return 0;
    }
 }
