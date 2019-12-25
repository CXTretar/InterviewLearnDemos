//
//  main.m
//  __block修饰符的使用
//
//  Created by CXTretar on 2019/12/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __block int age = 10;
        __block NSObject *objc = [[NSObject alloc] init];
        void (^block)(void) = ^{
            age ++;
            objc = nil;
            NSLog(@"%d", age);
        };

        block();
    }
    return 0;
}
