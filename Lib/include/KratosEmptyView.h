//
//  KEmptyView.h
//
//  Created by Kratos on 16/3/18.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KratosExtensionSrcName(file) [@"KratosCategoryExtension.bundle" stringByAppendingPathComponent:file]
#define KratosExtensionFrameworkSrcName(file) [@"Frameworks/KratosCategoryExtension.framework/KratosCategoryExtension.bundle" stringByAppendingPathComponent:file]

@interface KratosEmptyView : UIImageView
+ (instancetype)KratosEmptyViewWithIconName:(NSString *)iconname;
@end
