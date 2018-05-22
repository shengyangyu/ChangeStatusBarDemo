//
//  UIViewController+ChangeTheme.m
//  ChangeStatusBarDemo
//
//  Created by shengyangyu on 2018/5/22.
//  Copyright © 2018年 shengyangyu. All rights reserved.
//

#import "UIViewController+ChangeTheme.h"

#import <objc/runtime.h>
#import "ThemeManager.h"

void FSSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(cls, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(cls, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIViewController (ChangeTheme)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        FSSwizzleMethod([self class], @selector(preferredStatusBarStyle), @selector(fs_preferredStatusBarStyle));
    });
}

- (UIStatusBarStyle)fs_preferredStatusBarStyle {
    return ThemeManager.manager.currentTheme == FSAppThemeWhite ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;
}

@end
