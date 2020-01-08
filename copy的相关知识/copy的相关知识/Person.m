//
//  Person.m
//  copy的相关知识
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import "Person.h"

@implementation Person

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
     Person *person = [[Person allocWithZone:zone] init];
        person.age = self.age;
        person.name = self.name;
        return person;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"age = %d, name = %@", self.age, self.name];
}

@end
