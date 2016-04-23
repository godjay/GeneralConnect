//
//  RJHeaderView.h
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RJProvince;

//typedef void(^HeadViewBlock)();

@interface RJHeaderView : UITableViewHeaderFooterView

@property (strong,nonatomic)RJProvince *province;

- (void)headerClick:(void(^)())block;

@end
