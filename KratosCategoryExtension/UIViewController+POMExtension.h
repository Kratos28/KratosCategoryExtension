//
//  UIViewController+POMExtension.h
//  Pods
//
//  Created by RodYang on 16/4/20.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (POMExtension)
+ (instancetype)k_findBestViewController:(UIViewController *)vc;

/** 获取当前控制器 */
+ (instancetype)k_currentViewController;
@end
