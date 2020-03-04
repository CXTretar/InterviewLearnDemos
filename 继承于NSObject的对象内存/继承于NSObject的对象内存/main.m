//
//  main.m
//  继承于NSObject的对象内存
//
//  Created by CXTretar on 2019/7/14.
//  Copyright © 2019 CXTretar. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct Animal_IMPL {
    Class isa;
    int _age;
};

@interface Animal : NSObject
{
    @public
    int _age;
}

@end

@implementation Animal

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Animal *animal = [[Animal alloc] init];
        animal->_age = 2;
    }
    return 0;
}
