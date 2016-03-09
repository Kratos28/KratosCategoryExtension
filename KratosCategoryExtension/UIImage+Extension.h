//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+ (instancetype)captureWithView:(UIView *)view;

/**
 * 修发图片大小
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)resizedImage:(NSString *)name width:(CGFloat)width height:(CGFloat)height;


/**
 *  打水印
 *
 *  @param bg   背景图片
 *  @param logo 右下角的水印图片
 *
 *
 */
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo;
/**
 *  画带有边框的圆形图片
 *
 *  @param name        图片名字
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 *  @return
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  根据颜色生成一张图片
 *
 *  @param color 颜色
 *
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
