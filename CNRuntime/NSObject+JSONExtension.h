//
//  NSObject+JSONExtension.h
//  TYJSONExtension
//
//  Created by XuChengcheng on 2016/10/22.
//  Copyright © 2016年 xcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSONExtension)

+ (instancetype)modelWithDict:(NSDictionary *)dict;
+ (NSDictionary *)arrayContainModelClass;

@end
