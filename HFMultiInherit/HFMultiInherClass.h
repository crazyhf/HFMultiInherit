//
//  HFMultiInherClass.h
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import "HFMultiInherObj.h"
#import "HFInterfaceA.h"
#import "HFInterfaceB.h"


@interface HFClassA : NSObject <HFInterfaceA>

@end

@interface HFClassB : NSObject <HFInterfaceB>

@end

@interface HFMultiInherClass : HFMultiInherObj <HFInterfaceA, HFInterfaceB>

- (void)invokeCommon0;

- (void)invokeC0;

- (void)invokeC1;

@end
