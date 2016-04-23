//
//  RJCity.h
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJCity : NSObject
@property (nonatomic,copy)NSString *CityName;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *PID;
@property (nonatomic,copy)NSString *ZipCode;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)cityWithDic:(NSDictionary *)dic;
@end
