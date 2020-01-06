//
//  main.m
//  cache的内部实现
//
//  Created by CXTretar on 2020/1/6.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJClassInfo.h"
#import "Person.h"
#import "Student.h"
#import "GoodStudent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GoodStudent *goodStudent = [[GoodStudent alloc] init];
        mj_objc_class *goodStudentClass = (__bridge mj_objc_class *)[GoodStudent class];
        
        
        [goodStudent personTest];
        [goodStudent studentTest];
        [goodStudent goodStudentTest];
        [goodStudent goodStudentTest];
        [goodStudent studentTest];
        
        cache_t cache = goodStudentClass->cache;
        NSLog(@"%s %p", @selector(personTest), cache.imp(@selector(personTest)));
        NSLog(@"%s %p", @selector(studentTest), cache.imp(@selector(studentTest)));
        NSLog(@"%s %p", @selector(goodStudentTest), cache.imp(@selector(goodStudentTest)));
        
        bucket_t *buckets = cache._buckets;
        bucket_t bucket = buckets[(long long)@selector(studentTest) & cache._mask];
        NSLog(@"%s %p", bucket._key, bucket._imp);
        
        for (int i = 0; i < goodStudentClass->cache._mask; i ++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p %d", bucket._key, bucket._imp, i);
        }
        
        
    }
    return 0;
}
