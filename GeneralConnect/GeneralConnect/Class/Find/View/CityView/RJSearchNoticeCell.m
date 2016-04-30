//
//  RJSearchNoticeCell.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/25.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJSearchNoticeCell.h"
#import "RJAdvertiser.h"
#import "RJArea.h"

@interface RJSearchNoticeCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *clickLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *areaLabel;


@end

@implementation RJSearchNoticeCell

- (void)layoutSubviews{
    
    _titleLabel.text = _tonggao.title;
    
    _totalLabel.text = [NSString stringWithFormat:@"%d",_tonggao.total_people];
    _clickLabel.text = [NSString stringWithFormat:@"%d",_tonggao.click];
    _nameLabel.text = _tonggao.advertisers.name;
    _areaLabel.text = _tonggao.area.name;
}

@end
