//
//  Person.h
//  KVC Demo
//
//  Created by CXTretar on 2019/9/24.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
@public
    int age;
    int isAge;
    int _isAge;
    int _age;
}

@property(nonatomic, assign) int age;

@end

