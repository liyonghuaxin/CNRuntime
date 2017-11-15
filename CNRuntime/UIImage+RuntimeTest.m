//
//  UIImage+RuntimeTest.m
//  CNRuntime
//
//  Created by apple on 2017/11/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIImage+RuntimeTest.h"
#import <objc/runtime.h>

@implementation UIImage (RuntimeTest)

+(void)load{
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(imageWithName, imageName);
}

+(instancetype)imageWithName:(NSString *)imageStr{
    UIImage *image = [self imageWithName:imageStr];
    if (image == nil) {
        NSLog(@"加载的图片为空");
    }
    return image;
}

@end
