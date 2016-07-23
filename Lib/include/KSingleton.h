//
//  KSingletonH.h
//
//  Created by Kratos on 16/3/5.
//  Copyright © 2016年 Kratos. All rights reserved.
//

// .h文件

#define KSingletonH(name) + (instancetype)shared##name;



//.m文件
#define KSingletonM(name) \
static id _instance = nil;\
+ (instancetype)shared##name \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [[self alloc] init]; \
    }); \
    return _instance; \
} \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
    return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}