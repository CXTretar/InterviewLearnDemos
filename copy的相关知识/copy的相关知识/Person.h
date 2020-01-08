//
//  Person.h
//  copy的相关知识
//
//  Created by CXTretar on 2020/1/8.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCopying>

@property(nonatomic, assign) int age;
@property(nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
