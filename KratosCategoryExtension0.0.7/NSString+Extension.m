//
//  NSString+Extension.m
//  testprogress
//
//  Created by Kratos on 16/7/17.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (NSString *)cacheDir
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true).lastObject;
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}


/**
 将当前字符串拼接到doc目录后面
 */
- (NSString *)docDir
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).lastObject;
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}
/**
 将当前字符串拼接到tmp目录后面
 */
- (NSString *)tmpDir
{
    return  [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

@end
