//
//  RJCity.m
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJCity.h"

@implementation RJCity

+ (instancetype)cityWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
    
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}
@end
