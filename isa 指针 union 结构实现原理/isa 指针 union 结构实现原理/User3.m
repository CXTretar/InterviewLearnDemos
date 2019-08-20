//
//  User3.m
//  isa 指针 union 结构实现原理
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "User3.h"

#define VIP_MASK (1<<0)
#define SUPER_VIP_MASK (1<<1)
#define RED_NAME_MASK (1<<2)

@interface User3() {
    union {
        int bits;
        // 位域
        struct {
            char vip : 1;       // 分配1位
            char superVip : 1;
            char redName : 1;
        };
    } _totalPrivilege;      // 共1个字节,8位
}

@end

@implementation User3

- (void)setVip:(BOOL)vip {
    if (vip) {
        _totalPrivilege.bits |= VIP_MASK;
    } else {
        _totalPrivilege.bits &= ~VIP_MASK;
    }
}

- (BOOL)isVip {
    return !!(_totalPrivilege.bits & VIP_MASK);
}

- (void)setSuperVip:(BOOL)superVip {
    if (superVip) {
        _totalPrivilege.bits |= SUPER_VIP_MASK;
    } else {
        _totalPrivilege.bits &= ~SUPER_VIP_MASK;
    }
}

- (BOOL)isSuperVip {
    return !!(_totalPrivilege.bits & SUPER_VIP_MASK);
}

- (void)setRedName:(BOOL)redName {
    if (redName) {
        _totalPrivilege.bits |= RED_NAME_MASK;
    } else {
        _totalPrivilege.bits &= ~RED_NAME_MASK;
    }
}

- (BOOL)isRedName {
    return !!(_totalPrivilege.bits & RED_NAME_MASK);
}

@end
