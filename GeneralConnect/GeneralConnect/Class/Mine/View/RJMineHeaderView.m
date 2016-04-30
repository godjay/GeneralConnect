//
//  RJMineHeaderView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/28.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJMineHeaderView.h"

@interface RJMineHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *settingBtn;


@end

@implementation RJMineHeaderView

- (void)layoutSubviews{
    
    [self.settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];

}


- (void)settingBtnClick{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentSettingVc" object:nil];
}

@end
