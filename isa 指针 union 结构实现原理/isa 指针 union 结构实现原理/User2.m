//
//  User2.m
//  isa 指针 union 结构实现原理
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "User2.h"

@interface User2() {
    // 位域
    struct {
        char vip : 1;       // 分配1位
        char superVip : 1;
        char redName : 1;
    } _totalPrivilege;      // 共1个字节,8位
}

@end

@implementation User2

- (void)setVip:(BOOL)vip {
    _totalPrivilege.vip = vip;
}

- (BOOL)isVip {
    return !!(_totalPrivilege.vip);
}

- (void)setSuperVip:(BOOL)superVip {
    _totalPrivilege.superVip = superVip;
}

- (BOOL)isSuperVip {
    return !!(_totalPrivilege.superVip);
}

- (void)setRedName:(BOOL)redName {
    _totalPrivilege.redName = redName;
}

- (BOOL)isRedName {
    return !!(_totalPrivilege.redName);
}

@end
