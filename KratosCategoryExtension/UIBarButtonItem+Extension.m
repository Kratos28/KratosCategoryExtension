//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:imageName] forState:0];
    [button setImage:[UIImage imageNamed:highImageName] forState:UIControlStateHighlighted];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 设置按钮的尺寸为背景图片的尺寸
    CGRect buttonRect = button.frame;
//    buttonRect.size = button.currentBackgroundImage.size;
    buttonRect.size = button.currentImage.size;

    button.frame = buttonRect;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIBarButtonItem *)itemWithBackgroundImageName:(NSString *)backgroundImageName backgroundhighImageName:(NSString *)backgroundHighImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:backgroundHighImageName] forState:UIControlStateHighlighted];

    // 设置按钮的尺寸为背景图片的尺寸
    CGRect buttonRect = button.frame;
        buttonRect.size = button.currentBackgroundImage.size;
    button.frame = buttonRect;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}

+ (UIBarButtonItem *)itemWithBackgroundImageName:(NSString *)backgroundImageName backgroundDisabledImageName:(NSString *)backgroundHighImageName target:(id)target action:(SEL)action
{
    IButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"i_sochang_on"] forState:UIControlStateDisabled];
    // 设置按钮的尺寸为背景图片的尺寸
    CGRect buttonRect = button.frame;
    buttonRect.size = button.currentBackgroundImage.size;
    button.frame = buttonRect;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}
@end
