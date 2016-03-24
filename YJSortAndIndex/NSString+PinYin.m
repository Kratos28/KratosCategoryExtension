//
//  NSString+PinYin.m
//  拼音扩展
//
//  Created by  jason on 15/12/18.
//  Copyright © 2015年 renlairenwang. All rights reserved.
//

#import "NSString+PinYin.h"

@implementation NSString (PinYin)

- (NSString*)ChineseStringTransformToPinYin; {

    NSMutableString *mutableString = [[NSMutableString alloc] initWithString:self];
    
    // 转为带声调的拉丁文
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformMandarinLatin, NO);
    
    // 去掉声调
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, NO);
    
    return mutableString;
}


- (NSString*)fisrtUppercasePinYin {

    
    NSString *str = [self ChineseStringTransformToPinYin];
    
    
    return  [[str uppercaseString] substringToIndex:1];

    
}


- (BOOL)isContainChinese {

    for (int i = 0; i<self.length; i++) {
        
        unichar ch = [self characterAtIndex:i];
        if (0x4e00 < ch  && ch < 0x9fff) {
            return true;
        }
    }
    return false;
}

@end
