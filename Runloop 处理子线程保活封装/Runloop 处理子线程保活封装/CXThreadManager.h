//
//  CXThreadManager.h
//  Runloop 处理子线程保活封装
//
//  Created by CXTretar on 2019/8/29.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CXThreadTask)(void);

@interface CXThreadManager : NSObject

/**
 在当前子线程执行一个任务
 */
- (void)executeThreadTask:(CXThreadTask)task;

/**
 结束线程
 */
- (void)stopThread;

@end

