//
//  GCDTimer.h
//  GCD 定时器
//
//  Created by CXTretar on 2019/9/6.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCDTimer : NSObject


/**
 GCD 定时器

 @param task 定时任务
 @param start 延迟开始时间
 @param interval 任务周期时间
 @param repeats 是否循环
 @param async 是否异步
 @return 任务名称
 */
+ (NSString *)executeTask:(void (^)(void))task
              start:(NSTimeInterval)start
           interval:(NSTimeInterval)interval
            repeats:(BOOL)repeats
              async:(BOOL)async;

+ (NSString *)executeTarget:(id)target
              selector:(SEL)selector
                    start:(NSTimeInterval)start
                 interval:(NSTimeInterval)interval
                  repeats:(BOOL)repeats
                    async:(BOOL)async;

+ (void)cancelTask:(NSString *)task;

@end

