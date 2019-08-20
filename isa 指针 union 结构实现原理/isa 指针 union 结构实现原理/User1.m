//
//  User1.m
//  isa 指针 union 结构实现原理
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "User1.h"

// mask -> 掩码，一般用来按位与(&)运算的
//#define VIP_MASK 1
//#define SUPER_VIP_MASK 2
//#define RED_NAME_MASK 4

//#define VIP_MASK 0b00000001
//#define SUPER_VIP_MASK 0b00000010
//#define RED_NAME_MASK 0b00000100

#define VIP_MASK (1<<0)
#define SUPER_VIP_MASK (1<<1)
#define RED_NAME_MASK (1<<2)

@interface User1() {
    
    char _totalPrivilege;
}

@end

@implementation User1

- (void)setVip:(BOOL)vip {
    if (vip) {
        _totalPrivilege |= VIP_MASK;
    } else {
        _totalPrivilege &= ~VIP_MASK;
    }
}

- (BOOL)isVip {
    return !!(_totalPrivilege & VIP_MASK);
}

- (void)setSuperVip:(BOOL)superVip {
    if (superVip) {
        _totalPrivilege |= SUPER_VIP_MASK;
    } else {
        _totalPrivilege &= ~SUPER_VIP_MASK;
    }
}

- (BOOL)isSuperVip {
    return !!(_totalPrivilege & SUPER_VIP_MASK);
}

- (void)setRedName:(BOOL)redName {
    if (redName) {
        _totalPrivilege |= RED_NAME_MASK;
    } else {
        _totalPrivilege &= ~RED_NAME_MASK;
    }
}

- (BOOL)isRedName {
    return !!(_totalPrivilege & RED_NAME_MASK);
}

@end
