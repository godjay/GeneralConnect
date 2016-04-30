//
//  RJSettingCell.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/30.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJSettingCell.h"

@implementation RJSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.textLabel.font = [UIFont systemFontOfSize:14];
        
        UIView *sepView = [[UIView alloc] initWithFrame:CGRectMake(10, self.frame.size.height - 1, kScreenWidth, 1)];
        sepView.backgroundColor = [UIColor lightGrayColor];
        sepView.alpha = 0.2;
        [self.contentView addSubview:sepView];
    }
    
    return self;
}

@end
