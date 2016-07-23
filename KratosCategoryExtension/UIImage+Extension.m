//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 * 修发图片大小
 */
+ (UIImage *)k_imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize) newSize;
{
    if([[UIScreen mainScreen] scale] <= 3.0){
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 3.0);
    }else{
        UIGraphicsBeginImageContext(newSize);
    }
    // 绘制改变大小的图片
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}


- (UIImage *)imageWithScale:(CGFloat)width
{
    CGFloat height =  width * self.size.width / self.size.height;
    CGSize  currentSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(currentSize);
    [self drawInRect:CGRectMake(0, 0, currentSize.width, currentSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)resizedImage:(NSString *)name width:(CGFloat)width height:(CGFloat)height;

{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * width topCapHeight:image.size.height * height];
}
+ (instancetype)captureWithView:(UIView *)view {
    
    //1开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    //2.将控制器的View的layer渲染到上下文
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //4.结束上下文
    UIGraphicsEndImageContext();
    return  newImage;
    
}

+ (instancetype )waterImageWithBg:(NSString *)bg logo:(NSString *)logo {
    UIImage *bgimage =  [UIImage imageNamed:bg];
    
    //上下文:基于位图(bitmap),所有的东西需要绘制到一张新的图片上去
    //1.创建一个基于位图的上下文(开启一个基于位图的上下文)
    //size:新图片的尺寸
    //opaque:YES ==不透明, NO:透明
    //这行代码过后，就相当于创建一张新的bitmap,也就是的新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgimage.size, NO, 0.0);
    
    //2.画背景
    [bgimage drawInRect:CGRectMake(0, 0, bgimage.size.width, bgimage.size.height)];
    
    //3.画右下角的水印
    UIImage *waterImage = [UIImage imageNamed:logo];
    CGFloat scale = 0.6;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width * scale;
    CGFloat waterH = waterImage.size.height * scale;
    CGFloat waterX = bgimage.size.width - waterW - margin;
    CGFloat waterY = bgimage.size.height - waterH - margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    //4.从上下文取得制作完毕的UIimage对象
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    //5.结束上下文
    UIGraphicsEndImageContext();
    
    //6.显示到UIImageView
    //self.iconView.image = newImage;
    //7将image对象压缩为PNG格式的二进制数据
    NSData *data = UIImagePNGRepresentation(newImage);
    
    //8.写入文件
    NSString *path =[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"new.png"];
    [data writeToFile:path atomically:YES];
    
    return newImage;
}

/**
 *  画带有边框的圆形图片
 *
 *  @param name        图片名字
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *
 *  @return
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    // 1.加载原图
    UIImage *oldImage = [UIImage imageNamed:name];
    
    // 2.开启上下文
    CGFloat imageW = oldImage.size.width + 2 * borderWidth;
    CGFloat imageH = oldImage.size.height + 2 * borderWidth;
    CGSize imageSize = CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius = imageW * 0.5; // 大圆半径
    CGFloat centerX = bigRadius; // 圆心
    CGFloat centerY = bigRadius;
    CGContextAddArc(ctx, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx); // 画圆
    
    // 5.小圆
    CGFloat smallRadius = bigRadius - borderWidth;
    CGContextAddArc(ctx, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
    // 裁剪(后面画的东西才会受裁剪的影响)
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:CGRectMake(borderWidth, borderWidth, oldImage.size.width, oldImage.size.height)];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGFloat imageW =100;
    CGFloat imageH =100;
    
    //开启急于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0.0);
    //2.画一个color颜色的颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageH, imageW));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)circleImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (instancetype)k_circleImageNamed:(NSString *)name
{
    return [[self imageNamed:name] circleImage];
}

/**
 *  根据CIImage生成指定大小的UIimage(常见使用二维码模糊)
 *
 *  @param image CIImage
 *  @param Size  图片宽度
 *
 
 */
+ (UIImage *)k_createNonInterpolatedUIImageFormCIImage:(CIImage *)image withsize:(CGFloat)Size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(Size/CGRectGetWidth(extent), Size/CGRectGetHeight(extent));
    
    //创建BitMap
    size_t width  = CGRectGetWidth(extent) *scale;
    size_t height = CGRectGetHeight(extent) *scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo) kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //保存bitmap到图片
    CGImageRef sacleImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:sacleImage];
}

@end
