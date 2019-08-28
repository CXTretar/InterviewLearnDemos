//
//  NSObject+JSON.h
//  runtime 的项目运用
//
//  Created by CXTretar on 2019/8/28.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JSON)

+ (instancetype)cx_objectWithJson:(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
