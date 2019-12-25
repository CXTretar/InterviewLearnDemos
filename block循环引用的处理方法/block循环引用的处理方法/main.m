//
//  main.m
//  block循环引用的处理方法
//
//  Created by CXTretar on 2019/12/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [[Person alloc] init];
        person1.age = 10;
        person1.block = ^{
            NSLog(@"%d", person1.age);
        };
        person1.block();
        
        NSLog(@" ------------ ");
        
        // 使用 __weak 解决循环引用的场景
        Person *person2 = [[Person alloc] init];
        person2.age = 20;
        //         __weak Person *weakPerson = person2;
        __weak typeof(person2) weakPerson = person2;
        person2.block = ^{
            NSLog(@"%d", weakPerson.age);
        };
        person2.block();
        
        NSLog(@" ------------ ");
        
        // 使用 __block 解决循环引用的场景, 必须要调用block !!!
         Person *person3 = [[Person alloc] init];
        person3.age = 30;
        //         __block Person *weakPerson = person3;
        __block typeof(person3) blockPerson = person3;
        person3.block = ^{
            NSLog(@"%d", blockPerson.age);
            blockPerson = nil;
        };
        person3.block();
        NSLog(@" ------------ ");
        
        // 使用 __unsafe_unretained 解决循环引用的场景, 不安全
        Person *person4 = [[Person alloc] init];
        person4.age = 40;
        __unsafe_unretained Person *unsafePerson = person4;
        //        __unsafe_unretained typeof(person4) unsafePerson = person4;
        person4.block = ^{
            NSLog(@"%d", unsafePerson.age);
        };
        person4.block();
        
        // __weak：不会产生强引用，指向的对象销毁时，会自动让指针置为nil
        // __unsafe_unretained：不会产生强引用，不安全，指向的对象销毁时，指针存储的地址值不变
    }
    return 0;
}
