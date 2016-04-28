//
//  RJMineView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/28.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJMineView.h"
#import "RJMineHeaderView.h"

@interface RJMineView () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation RJMineView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        self.dataSource = self;
        self.delegate = self;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.text = @"嗯嗯";
    
    return cell;
}

- (UIView *)tableHeaderView{
    
    RJMineHeaderView *header = [[NSBundle mainBundle] loadNibNamed:@"RJMineHeaderView" owner:self options:nil].lastObject;
    header.frame = CGRectMake(0, 0, self.bounds.size.width, 250);

    [self addSubview:header];
    
    return header;
}

//返回不同组的header高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 2) {
        return 30;
    }
    
    return 5;
}

//返回不同组cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        return 80;
    }
    
    return 44;
}

@end
