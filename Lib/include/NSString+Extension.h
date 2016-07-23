//
//  NSString+Extension.h
//  testprogress
//
//  Created by Kratos on 16/7/17.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 将当前字符串拼接到cache目录后面
 */
- (NSString *)cacheDir;
/**
 将当前字符串拼接到doc目录后面
 */
- (NSString *)docDir;
/**
 将当前字符串拼接到tmp目录后面
 */
- (NSString *)tmpDir;
@end
