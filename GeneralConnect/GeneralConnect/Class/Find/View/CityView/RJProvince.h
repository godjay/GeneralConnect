//
//  RJProvince.h
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJProvince : NSObject
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *ProvinceName;
@property (strong,nonatomic)NSArray *cities;

@property (assign,nonatomic, getter = isExpanded) BOOL expanded;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)groupWithDic:(NSDictionary *)dic;
@end
