//
//  Person2.m
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person2.h"

@interface Person2 ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy, readonly) NSString *nickName;

@end


@implementation Person2

@synthesize name;
@dynamic address;


- (instancetype)init {
    if(self = [super init]) {
        
        self.name = @"Jack";
        [self setValue:@"nickName" forKey:@"nickName"];
        
        self.address = @"Xiamen";

        NSLog(@"name: %@", self.name);
        NSLog(@"nickName: %@", self.nickName);
        NSLog(@"address: %@", self.address);

    }
    return self;
}

@end
