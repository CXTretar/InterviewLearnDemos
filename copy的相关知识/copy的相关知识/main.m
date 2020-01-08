//
//  main.m
//  copy的相关知识
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

// 拷贝的目的：产生一个副本对象，跟源对象互不影响
// 修改了源对象，不会影响副本对象
// 修改了副本对象，不会影响源对象

/*
 iOS提供了2个拷贝方法
 1.copy，不可变拷贝，产生不可变副本
 
 2.mutableCopy，可变拷贝，产生可变副本
 
 深拷贝和浅拷贝
 1.深拷贝：内容拷贝，产生新的对象
 2.浅拷贝：指针拷贝，没有产生新的对象
 */

void test1() {
    NSLog(@"--- test1 ---");
    //        NSString *str1 = [NSString stringWithFormat:@"test"];
    //        NSString *str2 = [str1 copy]; // 返回的是NSString
    //        NSMutableString *str3 = [str1 mutableCopy]; // 返回的是NSMutableString
    
    NSMutableString *str1 = [NSMutableString stringWithFormat:@"test123123123123123"];
    NSString *str2 = [str1 copy]; // 深拷贝
    NSMutableString *str3 = [str1 mutableCopy]; // 深拷贝
    
    NSLog(@"%@ %@ %@", str1, str2, str3);
    NSLog(@"%p %p %p", str1, str2, str3);
    NSLog(@"%zd %zd %zd", str1.retainCount, str2.retainCount, str3.retainCount);
    //    [str1 release];
    [str2 release];
    [str3 release];
}

void test2() {
    NSLog(@"--- test2 ---");
    NSString *str1 = [[NSString alloc] initWithFormat:@"testadsfadsfadfsadfasdf"];
    NSString *str2 = [str1 copy]; // 浅拷贝，指针拷贝，没有产生新对象
    NSMutableString *str3 = [str1 mutableCopy]; // 深拷贝，内容拷贝，有产生新对象
    
    NSLog(@"%@ %@ %@", str1, str2, str3);
    NSLog(@"%p %p %p", str1, str2, str3);
    NSLog(@"%zd %zd %zd", str1.retainCount, str2.retainCount, str3.retainCount);
    
    [str3 release];
    [str2 release];
    [str1 release];
}

void test3() {
    NSLog(@"--- test3 ---");
    NSMutableString *str1 = [[NSMutableString alloc] initWithFormat:@"testadsfadsfadfsadfasdf123"];
    NSString *str2 = [str1 copy]; // 深拷贝
    NSMutableString *str3 = [str1 mutableCopy]; // 深拷贝
    
    [str1 appendString:@"111"];
    [str3 appendString:@"333"];
    
    NSLog(@"%@ %@ %@", str1, str2, str3);
    NSLog(@"%p %p %p", str1, str2, str3);
    NSLog(@"%zd %zd %zd", str1.retainCount, str2.retainCount, str3.retainCount);
    
    [str1 release];
    [str2 release];
    [str3 release];
}

void test4() {
    NSLog(@"--- test4 ---");
    NSString *str1 = [[NSString alloc] initWithFormat:@"testadsfadsfadfsadfasdf12"];
    NSString *str2 = [str1 copy]; // 浅拷贝
    
    str2 = @"change";
    
    NSLog(@"%@ %@", str1, str2);
    NSLog(@"%p %p", str1, str2);
    NSLog(@"%zd %zd", str1.retainCount, str2.retainCount);
    
    [str1 release];
    [str2 release];
}

void test5() {
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"a", @"b", nil];
    NSArray *array2 = [array1 copy]; // 浅拷贝
    NSMutableArray *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"%p %p %p", array1, array2, array3);
    
    [array1 release];
    [array2 release];
    [array3 release];
}

void test6() {
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithObjects:@"a", @"b", nil];
    NSArray *array2 = [array1 copy]; // 深拷贝
    NSMutableArray *array3 = [array1 mutableCopy]; // 深拷贝
    
    NSLog(@"%p %p %p", array1, array2, array3);
    
    [array1 release];
    [array2 release];
    [array3 release];
}

void test7() {
    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"jack", @"name", nil];
    NSDictionary *dict2 = [dict1 copy]; // 浅拷贝
    NSMutableDictionary *dict3 = [dict1 mutableCopy]; // 深拷贝
    
    NSLog(@"%p %p %p", dict1, dict2, dict3);
    
    [dict1 release];
    [dict2 release];
    [dict3 release];
}

void test8() {
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"jack", @"name", nil];
    NSDictionary *dict2 = [dict1 copy]; // 深拷贝
    NSMutableDictionary *dict3 = [dict1 mutableCopy]; // 深拷贝
    
    NSLog(@"%p %p %p", dict1, dict2, dict3);
    
    [dict1 release];
    [dict2 release];
    [dict3 release];
}

#import "Person.h"
// 自定义对象的copy
void test9() {
    Person *p1 = [[Person alloc] init];
    p1.age = 20;
    p1.name = @"jack";
    
    Person *p2 = [p1 copy];
    p2.age = 30;
    
    NSLog(@"%@", p1);
    NSLog(@"%@", p2);
    NSLog(@"%p -- %p", p1, p2);
    [p2 release];
    [p1 release];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //        test1();
        //        test2();
        //        test3();
        //        test4();
        test5();
        test6();
        test7();
        test8();
        test9();
    }
    return 0;
}
