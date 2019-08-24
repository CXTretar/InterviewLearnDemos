//
//  main.m
//  objc_msgsend 执行流程
//
//  Created by CXTretar on 2019/8/22.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person1.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        {
            Person *person = [[Person alloc] init];
            [Person classMethod];
            [person objectMethod];
        }
        NSLog(@" ------------------------------  ");
        {
            Person1 *person = [[Person1 alloc] init];
            [Person1 classMethod];
            [person instanceMethod];
        }
        
    }
    return 0;
}
