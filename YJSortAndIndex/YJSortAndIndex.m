//
//  YJSortAndIndex.m
//  拼音扩展
//
//  Created by  jason on 15/12/21.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "YJSortAndIndex.h"
#import "NSString+PinYin.h"

#define GB18030_ENCODING CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)
@implementation YJSortAndIndex



/**
 *  把联系人按首字母进行排序
 *
 *  @param array 需要排序的数组
 *
 *  @return 返回按各个字母排序好数组（数组中包含数组）
 */
+ (NSMutableArray*)sortArrayByFirstLetterWithArray:(NSMutableArray*)array {
    
    NSMutableArray *sortSectionArray = [NSMutableArray array];
    
    NSString *tempString;
    
    NSMutableArray *itme;
    
    // 首先对其进行排序
    NSMutableArray *sortArray = [[array sortedArrayUsingComparator:^NSComparisonResult(NSString* obj1, NSString* obj2) {
        
        NSString *str1 = [obj1 ChineseStringTransformToPinYin];
        
        NSString *str2 = [obj2 ChineseStringTransformToPinYin];
        
        return [str1 compare:str2];

    
    }] mutableCopy];
    

    // 对其排序
    for (int i = 0; i<sortArray.count; i++) {
        
        NSString *str = sortArray[i];
        
        
        NSString*firstString;
        
                if (str.length>0&&![str isContainChinese]) {
        
                    firstString = [[str substringToIndex:1] uppercaseString];
                }
                else if(str.length>0&&[str isContainChinese]){
        
        
                    firstString = [str fisrtUppercasePinYin];
        
                }
        
                // 不同
                if (![tempString isEqualToString:firstString]) {
        
                    //分组
                    itme = [NSMutableArray array];
                    [itme addObject:str];
                    tempString = firstString;
                    [sortSectionArray addObject:itme];
                }
                else {
                
                    [itme addObject:str];
                }
    }
    
    
    
    return sortSectionArray;
}


// 通过分组数组来获取索引
+ (NSMutableArray*)getSectionIndexsArrayWithSortSecionsArray:(NSMutableArray*)sortSecionsArray {
    
    
    NSMutableArray *indexsArray = [NSMutableArray array];
    
    for (NSArray *arr in sortSecionsArray) {
        
        NSString *str = [arr firstObject];
        
        NSString *firstLetter = @"";
        
        if (str.length>0&&![str isContainChinese]) {
            
            firstLetter = [[str substringToIndex:1] uppercaseString];
            
        }
        else if (str.length>0&&[str isContainChinese]) {
            
            
            firstLetter = [str fisrtUppercasePinYin];
            
        }
        
        [indexsArray addObject:firstLetter];
        
        
    }
    
    return indexsArray;
}

/**
 *  把联系人按首字母进行排序
 *
 *  @param array 需要排序的数组
 *
 *  @return 返回按各个字母排序好数组（数组中包含字典数组）
 */
+ (NSMutableArray*)sortArrayByFirstLetterWithArrayDict:(NSMutableArray*)arrayDict
{
    
    NSMutableArray *sortSectionArray = [NSMutableArray array];
    
    NSString *tempString;
    
    NSMutableArray *itme;
    
    // 首先对其进行排序
    NSMutableArray *sortArray = [[arrayDict sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary* obj2) {
        
        NSString * provincesStr =  obj1[@"provinces"];
        NSString * provincesStr1 =  obj2[@"provinces"];

        
        NSString *str1 = [provincesStr ChineseStringTransformToPinYin];
        
        NSString *str2 = [provincesStr1 ChineseStringTransformToPinYin];
        
        return [str1 compare:str2];
        
        
    }] mutableCopy];
    
    
    // 对其排序
    for (int i = 0; i<sortArray.count; i++) {
        
        
        NSDictionary *dict = sortArray[i];
        
        NSString *str = dict[@"provinces"];
        
        
        NSString*firstString;
        
        if (str.length>0&&![str isContainChinese]) {
            
            firstString = [[str substringToIndex:1] uppercaseString];
        }
        else if(str.length>0&&[str isContainChinese]){
            
            
            firstString = [str fisrtUppercasePinYin];
            
        }
        
        // 不同
        if (![tempString isEqualToString:firstString]) {
            
            //分组
            itme = [NSMutableArray array];
            [itme addObject:dict];
            tempString = firstString;
            [sortSectionArray addObject:itme];
        }
        else {
            
            [itme addObject:dict];
        }
    }
    
    
    
    return sortSectionArray;

}
+ (NSMutableArray*)getSectionIndexsArrayWithSortSecionsArrayDict:(NSMutableArray*)sortSecionsArrayDict
{
    
    NSMutableArray *indexsArray = [NSMutableArray array];
    
    for (NSArray *arr in sortSecionsArrayDict) {
        
        NSDictionary *ditc = [arr firstObject];
        NSString *str = ditc[@"provinces"];
        
        NSString *firstLetter = @"";
        
        if (str.length>0&&![str isContainChinese]) {
            
            firstLetter = [[str substringToIndex:1] uppercaseString];
            
        }
        else if (str.length>0&&[str isContainChinese]) {
            
            
            firstLetter = [str fisrtUppercasePinYin];
            
        }
        
        [indexsArray addObject:firstLetter];
        
        
    }
    
    return indexsArray;
 
}

//要出去字典数组的那个key
+ (NSMutableArray*)sortArrayByFirstLetterWithArrayDict:(NSMutableArray*)arrayDict WithDictKey:(NSString *)key
{
    
    
  NSMutableArray *sortSectionArray = [NSMutableArray array];
    

    NSString *tempString;
    
   NSMutableArray *itme;
    

    // 首先对其进行排序
    NSMutableArray *sortArray = [[arrayDict sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary* obj2) {
        
        NSString * provincesStr =  obj1[key];
        NSString * provincesStr1 =  obj2[key];
        
        
        NSString *str1 = [provincesStr ChineseStringTransformToPinYin];
        
        NSString *str2 = [provincesStr1 ChineseStringTransformToPinYin];
        
        return [str1 compare:str2];
        
        
    }] mutableCopy];
    

        
        // 对其排序
        for (int i = 0; i<sortArray.count; i++) {
            
            
            NSDictionary *dict = sortArray[i];
            
            NSString *str = dict[key];
            
            
            NSString*firstString;
            
            if (str.length>0&&![str isContainChinese]) {
                
                firstString = [[str substringToIndex:1] uppercaseString];
            }
            else if(str.length>0&&[str isContainChinese]){
                
                
                firstString = [str fisrtUppercasePinYin];
                
            }
            
            // 不同
            if (![tempString isEqualToString:firstString]) {
                //分组
                itme = [NSMutableArray array];
                [itme addObject:dict];
                tempString = firstString;
                [sortSectionArray addObject:itme];
            }
            else {
                
                [itme addObject:dict];
            }
        }


    return sortSectionArray;

}


//要出去字典数组的那个key
+ (NSMutableArray *)sortArrayByFirstLetterWithArrayDict1:(NSMutableArray*)arrayDict WithDictKey:(NSString *)key
{
    
    
    NSMutableArray *sortSectionArray = [NSMutableArray array];
    
    
    NSString *tempString;
    
    NSMutableArray *itme;
    
    
    // 首先对其进行排序
    NSMutableArray *sortArray = [[arrayDict sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *obj1, NSDictionary* obj2) {
        
        NSString * provincesStr =  obj1[key];
        NSString * provincesStr1 =  obj2[key];
        
        
        NSString *str1 = [provincesStr ChineseStringTransformToPinYin];
        
        NSString *str2 = [provincesStr1 ChineseStringTransformToPinYin];
        
        return [str1 compare:str2];
        
        
    }] mutableCopy];
    
    
    
    // 对其排序
    for (int i = 0; i<sortArray.count; i++) {
        
        
        NSDictionary *dict = sortArray[i];
        
        NSString *str = dict[key];
        
        
        NSString*firstString = @"";
        
        if (str.length>0&&![str isContainChinese]) {
            
            firstString = [[str substringToIndex:1] uppercaseString];
        }
        else if(str.length>0&&[str isContainChinese]){
            
            
            firstString = [str fisrtUppercasePinYin];
            
        }
        NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];

        // 不同
        if (![tempString isEqualToString:firstString]) {
            //分组
            itme = [NSMutableArray array];
            [itme addObject:dict];
            tempString = firstString;
//            [sortSectionArray addObject:itme];
            [dict1 setObject:firstString forKey:@"index"];
            [dict1 setObject:itme forKey:@"section"];
            [sortSectionArray addObject:dict1];

            
        }
        else {
            [itme addObject:dict];

        }

    }
    
    
    return sortSectionArray;
}




+ (NSMutableArray*)getSectionIndexsArrayWithSortSecionsArrayDict:(NSMutableArray*)sortSecionsArrayDict WithDictKey:(NSString *)key
{
    
   NSMutableArray *indexsArray = [NSMutableArray array];

    for (NSArray *arr in sortSecionsArrayDict) {
        
        NSDictionary *ditc = [arr firstObject];
        NSString *str = ditc[key];
        
        NSString *firstLetter = @"";
        
        if (str.length>0&&![str isContainChinese]) {
            
            firstLetter = [[str substringToIndex:1] uppercaseString];
            
        }
        else if (str.length>0&&[str isContainChinese]) {
            
            
            firstLetter = [str fisrtUppercasePinYin];
            
        }
        
        [indexsArray addObject:firstLetter];
        
        
    }

    return indexsArray;
}


@end
