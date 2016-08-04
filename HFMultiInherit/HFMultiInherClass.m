//
//  HFMultiInherClass.m
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import "HFMultiInherClass.h"


///==============================================================
@implementation HFClassA

- (void)invokeCommon0
{
    NSLog(@"HFClassA invokeCommon0");
}

- (void)invokeCommon1;
{
    NSLog(@"HFClassA invokeCommon1");
}

- (void)invokeA0
{
    NSLog(@"HFClassA invokeA0");
}

- (void)invokeA1
{
    NSLog(@"HFClassA invokeA1");
}

@end

@implementation HFClassB

- (void)invokeCommon0
{
    NSLog(@"HFClassB invokeCommon0");
}

- (void)invokeCommon1;
{
    NSLog(@"HFClassB invokeCommon1");
}

- (void)invokeB0
{
    NSLog(@"HFClassB invokeB0");
}

- (void)invokeB1
{
    NSLog(@"HFClassB invokeB1");
}

@end


///==============================================================

@implementation HFMultiInherClass

- (id)init
{
    if (self = [super init]) {
        [self addInheritedObj:[[HFClassA alloc] init]];
        [self addInheritedObj:[[HFClassB alloc] init]];
    }
    return self;
}

- (void)invokeCommon0
{
    NSLog(@"HFMultiInherClass invokeCommon0");
}

- (void)invokeC0
{
    NSLog(@"HFMultiInherClass invokeC0");
}

- (void)invokeC1
{
    NSLog(@"HFMultiInherClass invokeC1");
}

@end
