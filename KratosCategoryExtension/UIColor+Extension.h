//
//  UIColor+Extension.h
//  BWDApp
//
//  Created by Kratos on 15/8/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 *  通过16进制颜色通道返回颜色
 *
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

@end
