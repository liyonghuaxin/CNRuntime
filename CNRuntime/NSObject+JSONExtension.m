//
//  NSObject+JSONExtension.m
//  TYJSONExtension
//
//  Created by XuChengcheng on 2016/10/22.
//  Copyright © 2016年 xcc. All rights reserved.
//

#import "NSObject+JSONExtension.h"
#import <objc/message.h>

@implementation NSObject (JSONExtension)


+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    id objc = [[self alloc] init];
    
    unsigned int count = 0;
    // 思路：利用runtime，变量模型中所有属性
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivarList[i];
        
        // 获取成员属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *key = [ivarName substringFromIndex:1];
        
        id value = dict[key];
        if (value == nil) {
            continue;
        }
        
        // 获得成员变量的类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            Class modelClass = NSClassFromString(ivarType);
            value = [modelClass modelWithDict:value];
            
        } else if ([value isKindOfClass:[NSArray class]]) {

            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
            
                NSString *type = [self arrayContainModelClass][key];
                Class classModel = NSClassFromString(type);
                NSMutableArray *arrM = [NSMutableArray array];
                for (NSDictionary *dict in value) {
                    id model =  [classModel modelWithDict:dict];
                    [arrM addObject:model];
                }

                value = arrM;
            }
        }

        if (value) {
            [objc setValue:value forKey:key];
        }
    }
    
    return objc;
}

@end
