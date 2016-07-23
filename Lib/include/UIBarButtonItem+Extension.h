//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
//快速自定UIBarButtonItem
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;


/**
 *  //快速自定UIBarButtonItem

 *
 *  @param backgroundImageName     背景图片
 *  @param highImageName 高亮背景图片
 */
+ (UIBarButtonItem *)itemWithBackgroundImageName:(NSString *)backgroundImageName backgroundhighImageName:(NSString *)backgroundHighImageName target:(id)target action:(SEL)action;

/**
 //快速自定UIBarButtonItem
 
 *
 *  @param backgroundImageName     背景图片
 *  @param highImageName 不能点击状态背景图片
 */
+ (UIBarButtonItem *)itemWithBackgroundImageName:(NSString *)backgroundImageName backgroundDisabledImageName:(NSString *)backgroundHighImageName target:(id)target action:(SEL)action;
@end
