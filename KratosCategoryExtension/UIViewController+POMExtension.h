//
//  UIViewController+POMExtension.h
//  Pods
//
//  Created by RodYang on 16/4/20.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (POMExtension)
+ (instancetype) findBestViewController:(UIViewController *)vc;

/** 获取当前控制器 */
+ (instancetype) currentViewController;
@end
