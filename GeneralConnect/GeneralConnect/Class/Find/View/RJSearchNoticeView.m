//
//  RJSearchNoticeView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/25.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJSearchNoticeView.h"
#import "RJSearchNoticeCell.h"
#import "RJTonggao.h"

@interface RJSearchNoticeView () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation RJSearchNoticeView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
        self.delegate = self;
        self.dataSource = self;
        
        self.rowHeight = 120;
        
        [self registerNib:[UINib nibWithNibName:@"RJSearchNoticeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([self class])];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tonggaoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RJTonggao *tonggao = self.tonggaoArray[indexPath.row];
    RJSearchNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.tonggao = tonggao;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    NSInteger i = 1;
    if (section == 1) {
        i = 5;
    }else{
        i = 5;
    }
    
    return i;
}
@end
