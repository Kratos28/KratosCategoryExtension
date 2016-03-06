//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Kratos)

/**
 *  是否为今天
 *
 *
 */
- (BOOL)isToday;


/**
 *  是否为昨天
 *
 */
- (BOOL)isYesterday;

/**
 *  是否今年
 *
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 *
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 *
 */
- (NSDateComponents *)deltaWithNow;

@end
