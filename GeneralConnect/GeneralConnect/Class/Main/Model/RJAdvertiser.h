//
//  RJAdvertiser.h
//  GeneralConnect
//
//  Created by lirenjie on 16/4/29.
//  Copyright © 2016年 lirenjie. All rights reserved.
//   广告商模型

#import <Foundation/Foundation.h>

@interface RJAdvertiser : NSObject

@property (copy, nonatomic) NSString *address;   //公司地址
@property (copy, nonatomic) NSString *content;   //公司介绍
@property (copy, nonatomic) NSString *desc;      //公司简介
@property (copy, nonatomic) NSString *name;      //公司名称
@property (copy, nonatomic) NSString *email;     //公司邮箱
@property (copy, nonatomic) NSString *phone;     //公司电话
@property (copy, nonatomic) NSString *logo;      //公司logo

@property (assign, nonatomic) int click;         //点击率
@property (assign, nonatomic) int user_id;       //点击率

@end
