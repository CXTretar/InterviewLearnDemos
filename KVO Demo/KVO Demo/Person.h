//
//  Person.h
//  KVO Demo
//
//  Created by CXTretar on 2019/9/8.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    @public
    NSString *_phone;
};

@property(nonatomic, assign) int age;
@property(nonatomic, copy) NSString *name;
//@property(nonatomic, copy) NSString *phone;

@end
