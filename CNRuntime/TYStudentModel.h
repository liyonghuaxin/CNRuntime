//
//  TYStudentModel.h
//  TYJSONExtension
//
//  Created by XuChengcheng on 2016/10/22.
//  Copyright © 2016年 xcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYDogModel;

@interface TYStudentModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) TYDogModel *dog;
@property (nonatomic, strong) NSArray *books;

@end
