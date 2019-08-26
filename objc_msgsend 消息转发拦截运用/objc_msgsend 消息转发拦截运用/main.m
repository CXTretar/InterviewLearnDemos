//
//  main.m
//  objc_msgsend 消息转发拦截运用
//
//  Created by CXTretar on 2019/8/26.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc]init];
        [person study];
        [person work];
        [person other];
        
    }
    return 0;
}
