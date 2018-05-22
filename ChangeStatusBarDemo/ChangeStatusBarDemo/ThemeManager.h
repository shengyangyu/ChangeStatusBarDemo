//
//  ThemeManager.h
//  ChangeStatusBarDemo
//
//  Created by shengyangyu on 2018/5/22.
//  Copyright © 2018年 shengyangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

/** app主题颜色 */
typedef NS_ENUM(NSUInteger, FSAppThemeType) {
    FSAppThemeBlack,    // 黑色，默认
    FSAppThemeWhite     // 白色
};

@interface ThemeManager : NSObject

/** 当前主题模式 */
@property (nonatomic, assign) FSAppThemeType currentTheme;

+ (instancetype)manager;

@end
