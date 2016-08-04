//
//  HFInterfaceB.h
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HFInterfaceB <NSObject>

@optional

- (void)invokeCommon0;

- (void)invokeCommon1;

- (void)invokeB0;

- (void)invokeB1;

@end
