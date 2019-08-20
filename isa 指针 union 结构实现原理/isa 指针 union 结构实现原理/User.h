//
//  User.h
//  isa 指针 union 结构实现原理
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (assign, nonatomic, getter=isVip) BOOL vip;
@property (assign, nonatomic, getter=isSuperVip) BOOL superVip;
@property (assign, nonatomic, getter=isRedName) BOOL redName;

@end
