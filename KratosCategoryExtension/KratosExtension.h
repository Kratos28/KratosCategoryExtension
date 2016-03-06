//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//


#import "NSDate+Kratos.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+Extension.h"
#import "UIButton+CenterImageAndTitle.h"
#import "UIView+AutoLayout.h"


#ifdef DEBUG // 调试状态, 打开LOG功能
#define KLog(...) NSLog(__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define KLog(...)
#endif

// 随机色
#define KRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//灰色
#define KGlobalBg    KColor(211, 211, 211)
// 是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

/**
 *  屏幕宽度
 */
#define  KScreenW  [UIScreen mainScreen].bounds.size.width
#define KColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
/**
 *  屏幕高度
 */
#define KScreenH [UIScreen mainScreen].bounds.size.height

