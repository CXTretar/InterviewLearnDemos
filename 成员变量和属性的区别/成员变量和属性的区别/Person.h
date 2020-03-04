//
//  Person.h
//  成员变量和属性的区别
//
//  Created by CXTretar on 2020/3/4.
//  Copyright © 2020 CXTretar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    int _phone;
    NSString *_nickname;
    
@public
    NSString *_publicString;
    
@protected
    NSString *_protectedString;
    
@private
    NSString *_privateString;
}

@end

NS_ASSUME_NONNULL_END
