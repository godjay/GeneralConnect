//
//  RJTonggao.h
//  GeneralConnect
//
//  Created by lirenjie on 16/4/29.
//  Copyright © 2016年 lirenjie. All rights reserved.
//  通告模型

#import <Foundation/Foundation.h>

@class RJAdvertiser;
@class RJArea;
typedef enum {
    gender0 = 0,
    gender1 = 1,
    gender2 = 2,
}gender;

typedef enum {
    status0 = 0,
    status1 = 1,
    status2 = 2,
}status;

@interface RJTonggao : NSObject

@property (strong, nonatomic) RJAdvertiser *advertisers;
@property (strong, nonatomic) RJArea *area;


@property (copy, nonatomic) NSString *content;          //需求详情
@property (copy, nonatomic) NSString *file;             //文件路径
@property (copy, nonatomic) NSString *images;           //图片路径
@property (copy, nonatomic) NSString *title;            //活动主题

@property (assign, nonatomic) int ID;                   //通告的序号
@property (assign, nonatomic) int addtime;              //添加时间
@property (assign, nonatomic) int endtime;              //结束时间
@property (assign, nonatomic) int click;                //点击率
@property (assign, nonatomic) int total_people;         //报名人数
@property (assign, nonatomic) int ader_id;              //广告商ID
@property (assign, nonatomic) int area_id;              //工作地点
@property (assign, nonatomic) gender *gender;           //性别
@property (assign, nonatomic) status *status;           //状态


@end

/*
 deposit = "0.00";
 "is_delete" = 0;
 "is_public" = 1;
 price = "0.00";
 tags =         (
 );
*/