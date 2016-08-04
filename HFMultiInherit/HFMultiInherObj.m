//
//  HFMultiInherObj.m
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import "HFMultiInherObj.h"


@interface HFMultiInherInfo : NSObject

@property (nonatomic, assign) SEL aSelector;

@property (nonatomic, strong) id  aTarget;

@end

@implementation HFMultiInherInfo

@end


///=======================================================================
@implementation HFMultiInherObj
{
    NSMutableArray<NSObject *> * _multiInherList;
    NSMutableArray<NSString *> * _selSuffixList;
}

- (void)addInheritedObj:(NSObject *)anInstance
{
    [_multiInherList addObject:anInstance];
    [_selSuffixList addObject:[NSString stringWithFormat:@"_class_%@", NSStringFromClass(anInstance.class)]];
}

- (HFMultiInherInfo *)multiInheritInfo4Selector:(SEL)aSelector
{
    NSMutableArray * aSelStringAry = [NSStringFromSelector(aSelector) componentsSeparatedByString:@":"].mutableCopy;
    id aRealInstance = self;
    
    NSString * firstPiece = aSelStringAry.firstObject;
    for (NSUInteger index = 0; index < _selSuffixList.count; index++) {
        NSString * aSelSuffix = _selSuffixList[index];
        if (YES == [firstPiece hasSuffix:aSelSuffix]) {
            aSelStringAry[0] = [firstPiece stringByReplacingOccurrencesOfString:aSelSuffix withString:@""];
            aRealInstance    = _multiInherList[index];
            break;
        }
    }
    
    HFMultiInherInfo * multiInherInfo = [[HFMultiInherInfo alloc] init];
    multiInherInfo.aTarget   = aRealInstance;
    multiInherInfo.aSelector = NSSelectorFromString([aSelStringAry componentsJoinedByString:@":"]);
    
    return multiInherInfo;
}


#pragma mark - forward for multi inherit

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    HFMultiInherInfo * multiInherInfo = [self multiInheritInfo4Selector:anInvocation.selector];
    
    if (YES == [multiInherInfo.aTarget respondsToSelector:multiInherInfo.aSelector]) {
        anInvocation.target   = multiInherInfo.aTarget;
        anInvocation.selector = multiInherInfo.aSelector;
        [anInvocation invoke];
        return;
    }
    
    for (NSObject * anInstance in _multiInherList) {
        if (YES == [anInstance respondsToSelector:multiInherInfo.aSelector]) {
            anInvocation.target   = anInstance;
            anInvocation.selector = multiInherInfo.aSelector;
            [anInvocation invoke];
            return;
        }
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    for (NSObject * anIns in _multiInherList)
    {
        HFMultiInherInfo * multiInherInfo = [self multiInheritInfo4Selector:aSelector];
        NSMethodSignature * aMethodSign = [anIns methodSignatureForSelector:multiInherInfo.aSelector];
        
        if (nil != aMethodSign) return aMethodSign;
    }
    return nil;
}


#pragma mark - initialization

- (id)init
{
    if (self = [super init]) {
        _multiInherList   = [NSMutableArray array];
        _selSuffixList = [NSMutableArray array];
    }
    return self;
}

@end