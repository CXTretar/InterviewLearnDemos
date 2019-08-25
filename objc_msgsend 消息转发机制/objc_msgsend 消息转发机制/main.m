//
//  main.m
//  objc_msgsend 消息转发机制
//
//  Created by CXTretar on 2019/8/25.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person1.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 使用 forwardingTargetForSelector 方式转发消息
        {
            [Person classMethod];
            
            Person *person = [[Person alloc]init];
            [person instanceMethod];
        }
        // 使用 methodSignatureForSelector 方式转发消息
        {
            [Person1 classMethod];
            
            Person1 *person = [[Person1 alloc]init];
            [person instanceMethod];
        }
    
        
    }
    return 0;
}
