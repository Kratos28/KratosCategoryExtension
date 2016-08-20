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
+ (void )createPropertyCodeWith:(NSDictionary *)dict
{
    
    //属性代码
    
    
    NSMutableString *str = [NSMutableString string];
    
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull PrepertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        NSLog(@"%@, %@",PrepertyName, [value class]);
        
        
        NSString *code;
        if ([value isKindOfClass:NSClassFromString(@"__NSCFString")] ||
            [value isKindOfClass:NSClassFromString(@"NSTaggedPointerString")])
        {//字符串
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",PrepertyName];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSNumber *%@;",PrepertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFArray")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",PrepertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFDictionary")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",PrepertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",PrepertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSDictionaryM")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSMutableDictionary *%@;",PrepertyName];
            
        }else if ([value isKindOfClass:NSClassFromString(@"__NSArrayM")])
        {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSMutableArray *%@;",PrepertyName];
            
        }
        [str appendFormat:@"\n%@\n",code];
        
    }];
    
    NSLog(@"%@",str);
    
}

@end
