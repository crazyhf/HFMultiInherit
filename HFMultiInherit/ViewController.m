//
//  ViewController.m
//  HFMultiInherit
//
//  Created by crazylhf on 16/8/4.
//  Copyright © 2016年 crazylhf. All rights reserved.
//

#import "ViewController.h"
#import "HFMultiInherClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"====================  HFClassA  ==============================");
    HFClassA * aClassA = [[HFClassA alloc] init];
    [aClassA invokeCommon0];
    [aClassA invokeCommon1];
    [aClassA invokeA0];
    [aClassA invokeA1];
    
    
    NSLog(@"====================  HFClassB  ==============================");
    HFClassB * aClassB = [[HFClassB alloc] init];
    [aClassB invokeCommon0];
    [aClassB invokeCommon1];
    [aClassB invokeB0];
    [aClassB invokeB1];
    
    
    NSLog(@"====================  HFMultiInherClass  ==============================");
    HFMultiInherClass * aClassC = [[HFMultiInherClass alloc] init];
    [aClassC invokeCommon0];
    [aClassC invokeCommon1];
    [aClassC invokeA0];
    [aClassC invokeA1];
    [aClassC invokeB0];
    [aClassC invokeB1];
    [aClassC invokeC0];
    [aClassC invokeC1];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [aClassC performSelector:@selector(invokeCommon0_class_HFClassA)];
    [aClassC performSelector:@selector(invokeCommon0_class_HFClassB)];
    [aClassC performSelector:@selector(invokeCommon1_class_HFClassA)];
    [aClassC performSelector:@selector(invokeCommon1_class_HFClassB)];
#pragma clang diagnostic pop
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
