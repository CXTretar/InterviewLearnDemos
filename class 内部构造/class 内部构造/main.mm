//
//  main.m
//  class 内部构造
//
//  Created by CXTretar on 2019/8/22.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MaleStudent.h"
#import "MJClassInfo.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // sel_registerName 等同于 @selector , SEL方法名字
        NSLog(@"%p -- %p", @selector(personTest), sel_registerName("personTest"));
        
        Person *person = [[Person alloc]init];
        mj_objc_class *personClass = (__bridge mj_objc_class *)[Person class];
        [person personTest];
        
        MaleStudent *maleStudent = [[MaleStudent alloc]init];
        mj_objc_class *maleStudentClass = (__bridge mj_objc_class *)[MaleStudent class];
        [maleStudent maleStudentTest];
        
        cache_t cache = maleStudentClass->cache;
        bucket_t *buckets = cache._buckets;
        
        bucket_t bucket = buckets[(long long)@selector(studentTest) & cache._mask];
        NSLog(@"%s %p", (char *)bucket._key, bucket._imp);
        
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", (char *)bucket._key, bucket._imp);
        }
        
    }
    return 0;
}
