//
//  main.m
//  block的变量捕捉
//
//  Created by CXTretar on 2019/11/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

int age_ = 10;
static int height_ = 10;


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int weight = 10;
        
        void (^block)(void) = ^{
            NSLog(@"age is %d, height is %d, weight is %d", age_, height_, weight);
        };
        
        age_ = 20;
        height_ = 20;
        weight = 20;
        
        block();
        
        NSLog(@"%@", [block class]);
    }
    return 0;
}
