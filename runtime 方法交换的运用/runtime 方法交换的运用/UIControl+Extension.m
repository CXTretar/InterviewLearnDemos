//
//  UIControl+Extension.m
//  runtime 方法交换的运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
        Method overrideMethod = class_getInstanceMethod(self, @selector(cx_sendAction:to:forEvent:));
        method_exchangeImplementations(originMethod, overrideMethod);
    });
   
}

- (void)cx_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 调用系统原来的实现
    [self cx_sendAction:action to:target forEvent:event];
    
    /*
     [self sendAction:action to:target forEvent:event];
     错误的调用,会引起死循环,
     sendAction:to:forEvent: 调用实际就是 cx_sendAction:to:forEvent:
     cx_sendAction:to:forEvent: 调用实际就是 sendAction:to:forEvent:
     所以用 cx_sendAction:to:forEvent: 就不会死循环
     */
}

@end
