//
//  Person+Eat.h
//  Category
//
//  Created by CXTretar on 2019/11/2.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Person.h"

@interface Person (Eat) <NSCopying, NSCoding>

@property(nonatomic, assign) int weight;
@property(nonatomic, assign) double height;

- (void)eat;

@end
