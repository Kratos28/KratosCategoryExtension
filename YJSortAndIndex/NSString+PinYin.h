//
//  NSString+PinYin.h
//  拼音扩展
//
//  Created by  jason on 15/12/18.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PinYin)
/**
 * 汉子转为拼音
 */
- (NSString*)ChineseStringTransformToPinYin;

/**
 *  获取汉字的首字的首字母大写
 *
 *  @return 汉字的首字的首字母大写
 */
- (NSString*)fisrtUppercasePinYin;



/**
 *  是否包含中文
 *
 *  @return BOOL值
 */
- (BOOL)isContainChinese;

@end
