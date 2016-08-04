//
//  HFInterfaceA.h
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HFInterfaceA <NSObject>

@optional

- (void)invokeCommon0;

- (void)invokeCommon1;

- (void)invokeA0;

- (void)invokeA1;

@end
