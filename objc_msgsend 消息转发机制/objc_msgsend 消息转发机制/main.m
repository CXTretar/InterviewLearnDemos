//
//  main.m
//  objc_msgsend 消息转发机制
//
//  Created by CXTretar on 2019/8/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        [Person classMethod];
        
        Person *person = [[Person alloc]init];
        [person instanceMethod];
        
        
    }
    return 0;
}
