//
//  ViewController.m
//  CNRuntime
//
//  Created by apple on 2017/11/14.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+RuntimeTest.h"
#import "PersonVC.h"
#import "ZYPerson.h"
#import "NSObject+Property.h"
#import "NSObject+JSONExtension.h"
#import "TYStudentModel.h"
#import "TYDogModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //方法交换
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(20, 88, 150, 30);
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"方法交换" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    //动态添加方法
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(20, 88+50, 150, 30);
    [btn2 addTarget:self action:@selector(btn2Click) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"动态添加方法" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    //消息转发机制
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(20, 88+50+50, 150, 30);
    [btn3 addTarget:self action:@selector(btn3Click) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setTitle:@"消息转发机制" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn3];
    //给分类添加属性
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(20, 88+50+50+50, 150, 30);
    [btn4 addTarget:self action:@selector(btn4Click) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"给分类添加属性" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn4];
    //字典转模型
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(20, 88+50+50+50+50, 150, 30);
    [btn5 addTarget:self action:@selector(btn5Click) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setTitle:@"字典转模型" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [self.view addSubview:btn5];
}
//方法交换
- (void)btn1Click{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(200, 88, 80, 100)];
    imageV.image = [UIImage imageNamed:@"avatar.jpg"];
    [self.view addSubview:imageV];
}
//动态添加方法
- (void)btn2Click{
    PersonVC *p = [[PersonVC alloc] init];
    [p performSelector:@selector(eat)];
}
//消息转发机制
- (void)btn3Click{
    /*
     消息转发机制
     1.方法的动态解析，对当前类动态增加方法
     2.备用接收者，指定对某一个对象来执行方法
     3.完整的消息转发，指定方法签名--修改响应对象，修改实现方法
     4.消息没发实现会调用doesNotRecognizeSelector
     */
    ZYPerson *per = [ZYPerson new];
    [per performSelector:@selector(testMethod)];
}
//给分类添加属性
- (void)btn4Click{
    
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"hello";
    NSLog(@"%@",objc.name);
}
//字典转模型
- (void)btn5Click{
    //字典转模型runtime
    [self dicConversionModel];
    //字典转模型KVC
    [self dicConversionModelKVC];
}
- (void)dicConversionModel{
    NSDictionary *json = @{
                           @"name" : @"Tom",
                           @"age" : @(20),
                           @"money" : @"1000",
                           @"dog" : @{
                                   @"name" : @"Persia",
                                   @"price" : @"500",
                                   @"fish" : @{
                                           @"name" : @"鱼",
                                           @"weight" : @(50),
                                           }
                                   },
                           @"books" : @[
                                   @{
                                       @"name" : @"c语言",
                                       @"price" : @20.8,
                                       @"publisher" : @"清华大学"
                                       },
                                   @{
                                       @"name" : @"乔布斯传",
                                       @"price" : @50.8,
                                       @"publisher" : @"清华大学"
                                       },
                                   ]
                           };
    
    
    TYStudentModel *student = [TYStudentModel modelWithDict:json];
    NSLog(@"student : %@", student);
}
- (void)dicConversionModelKVC{
    //必须保证，模型中的属性和字典中的key一一对应
    NSDictionary *dic = @{
                          @"name" : @"Persia",
                          @"price" : @"500",
                          @"fish" : @{
                                  @"name" : @"鱼",
                                  @"weight" : @(50),
                                  }
                          };
    TYDogModel *dogModel = [[TYDogModel alloc] init];
    [dogModel setValuesForKeysWithDictionary:dic];
    NSLog(@"%@",dogModel);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
