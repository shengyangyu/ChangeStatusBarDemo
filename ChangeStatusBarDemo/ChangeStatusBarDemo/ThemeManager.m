//
//  ThemeManager.m
//  ChangeStatusBarDemo
//
//  Created by shengyangyu on 2018/5/22.
//  Copyright © 2018年 shengyangyu. All rights reserved.
//

#import "ThemeManager.h"

@implementation ThemeManager

+ (instancetype)manager {
    static ThemeManager *user;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [ThemeManager new];
    });
    return user;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _currentTheme = FSAppThemeBlack;
    }
    return self;
}

@end
