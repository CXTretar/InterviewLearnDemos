//
//  main.m
//  关联对象
//
//  Created by CXTretar on 2019/11/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test.h"
#import "Person+Test2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.age = 10;
        person.name = @"Jack";
        person.height = 174.0;
        person.nickName = @"NickJack";
        person.weight = 70.5;
        NSLog(@"%d - %@ - %f", person.age, person.name, person.height);
        NSLog(@"nickName - %@ weight - %f", person.nickName, person.weight);
    }
    return 0;
}
