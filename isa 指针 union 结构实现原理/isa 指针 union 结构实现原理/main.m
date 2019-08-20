//
//  main.m
//  isa 指针 union 结构实现原理
//
//  Created by CXTretar on 2019/8/20.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "User1.h"
#import "User2.h"
#import "User3.h"

// isa 指针arm64数据结构
/*
union isa_t
{
    Class cls;
    uintptr_t bits;
# if __arm64__
#   define ISA_MASK        0x0000000ffffffff8ULL
#   define ISA_MAGIC_MASK  0x000003f000000001ULL
#   define ISA_MAGIC_VALUE 0x000001a000000001ULL
    struct {
        uintptr_t nonpointer        : 1;
        uintptr_t has_assoc         : 1;
        uintptr_t has_cxx_dtor      : 1;
        uintptr_t shiftcls          : 33; // MACH_VM_MAX_ADDRESS 0x1000000000
        uintptr_t magic             : 6;
        uintptr_t weakly_referenced : 1;
        uintptr_t deallocating      : 1;
        uintptr_t has_sidetable_rc  : 1;
        uintptr_t extra_rc          : 19;
    };
};
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 普通形式
        {
            User *user = [[User alloc]init];
            
            user.vip = YES;
            user.superVip = NO;
            user.redName = YES;
            
            NSLog(@"user -- vip:%d superVip:%d redName:%d",  user.isVip, user.isSuperVip, user.isRedName);
        }
        // char形式
        {
            User1 *user = [[User1 alloc]init];
            
            user.vip = YES;
            user.superVip = NO;
            user.redName = YES;
            
            NSLog(@"user1 -- vip:%d superVip:%d redName:%d",  user.isVip, user.isSuperVip, user.isRedName);
        }
        // struct形式
        {
            User2 *user = [[User2 alloc]init];
            
            user.vip = YES;
            user.superVip = NO;
            user.redName = YES;
            
            NSLog(@"user2 -- vip:%d superVip:%d redName:%d",  user.isVip, user.isSuperVip, user.isRedName);
        }
        // union形式
        {
            User3 *user = [[User3 alloc]init];
            
            user.vip = YES;
            user.superVip = NO;
            user.redName = YES;
            
            NSLog(@"user3 -- vip:%d superVip:%d redName:%d",  user.isVip, user.isSuperVip, user.isRedName);
        }
        
    }
    return 0;
}
