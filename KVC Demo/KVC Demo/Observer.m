//
//  Observer.m
//  KVC Demo
//
//  Created by CXTretar on 2019/9/24.
//  Copyright © 2019 CXTretar. All rights reserved.
//

#import "Observer.h"

@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"observeValueForKeyPath - %@", change);
}


@end
