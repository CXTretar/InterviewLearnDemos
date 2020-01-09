//
//  main.m
//  @autoreleasepool 相关知识
//
//  Created by CXTretar on 2020/1/9.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [[Person alloc] init];
//        _objc_autoreleasePoolPrint();
        @autoreleasepool {
            Person *person2 = [[Person alloc] init];
            Person *person3 = [[Person alloc] init];
//            _objc_autoreleasePoolPrint();
            @autoreleasepool {
                Person *person4 = [[Person alloc] init];
//                                _objc_autoreleasePoolPrint();
            }
        }
//                _objc_autoreleasePoolPrint();
        
    }
    return 0;
}
