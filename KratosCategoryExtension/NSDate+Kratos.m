//
//  Kratos
//
//  Created by Kratos on 15/11/12.
//  Copyright (c) 2015年 Kratos. All rights reserved.
//

#import "NSDate+Kratos.h"

@implementation NSDate (Kratos)

/**
 *  是否为今天
 *
 *
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;
    
    //获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.year == nowCmps.year &&
           selfCmps.month == nowCmps.month &&
           selfCmps.day == nowCmps.day;

}
/**
 *  是否为昨天
 *
 */
- (BOOL)isYesterday
{
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    NSDate *selfDate = [self dateWithYMD];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate  options:0];
    return cmps.day == 1;
}

/**
 *  是否今年
 *
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit =  NSCalendarUnitYear;
    
    
    //获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return selfCmps.year == nowCmps.year;
}
/**
 *  返回一个只有年月日的时间
 *
 */
- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

/**
 *  获得与当前时间的时秒分差距
 *
 */
- (NSDateComponents *)deltaWithNow
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit =  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    return [calendar components:unit fromDate:self toDate:[NSDate date] options:0];
}


@end
