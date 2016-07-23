//
//  NSObject+Extension.m
//  test
//
//  Created by Kratos on 16/4/28.
//  Copyright © 2016年 Kratos. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
/**
 *  调用方法
 *
 *  @param selector 方法名字
 *  @param objects  参数
 *
 *  @return 返回值
 */
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects
{
    // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        [NSException raise:@"错误" format:@"%@方法找不到", NSStringFromSelector(selector)];
    }
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self;
    invocation.selector = selector;
    
    
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    paramsCount = MIN(paramsCount, objects.count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = objects[i];
        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    [invocation invoke];
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
    return returnValue;
    
}
@end
