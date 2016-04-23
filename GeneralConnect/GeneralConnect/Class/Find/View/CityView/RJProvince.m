//
//  RJProvince.m
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJProvince.h"
#import "RJCity.h"
@implementation RJProvince

+ (instancetype)groupWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //1
        [self setValuesForKeysWithDictionary:dic];
        //2
        NSMutableArray *cityArray = [NSMutableArray array];
        for (NSDictionary *dict in self.cities) {
            RJCity *city = [RJCity cityWithDic:dict];
            [cityArray addObject:city];
        }
        self.cities = cityArray;
    }
    return self;
}

@end
