//
//  TYDogModel.h
//  TYJSONExtension
//
//  Created by XuChengcheng on 2016/10/22.
//  Copyright © 2016年 xcc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TYFishModel;

@interface TYDogModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) TYFishModel *fish;

@end
