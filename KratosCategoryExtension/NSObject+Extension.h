//
//  NSObject+Extension.h
//  test
//
//  Created by Kratos on 16/4/28.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)
/**
 *  调用方法
 *
 *  @param selector 方法名字
 *  @param objects  参数
 *
 *  @return 返回值
 */
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects;



/**
 *  动态产生属性名字并且打印出来
 *
 *  @param dict 模型字典
 */
+ (void )createPropertyCodeWith:(NSDictionary *)dict;

@end
