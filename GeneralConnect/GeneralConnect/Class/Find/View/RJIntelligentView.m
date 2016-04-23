//
//  RJIntelligentView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/22.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJIntelligentView.h"

@interface RJIntelligentView () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *titleArray;
@property (weak, nonatomic) UITableViewCell *lastCell;

@end

@implementation RJIntelligentView

- (NSArray *)titleArray{
    
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"智能排序",@"最新发布",@"最近截止", nil];
    }
    
    return _titleArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]){
        
        self.delegate = self;
        self.dataSource = self;
        self.scrollEnabled = NO;
        self.rowHeight = 35;
        
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.titleArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = _titleArray[indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.text = title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (_lastCell == nil) {
        
        _lastCell = cell;
        cell.textLabel.textColor = [UIColor colorWithRed:118/255.0 green:215/255.0 blue:254/255.0 alpha:1.0];
    }else{
        
        _lastCell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.textColor = [UIColor colorWithRed:118/255.0 green:215/255.0 blue:254/255.0 alpha:1.0];
        _lastCell = cell;
    }
    
    NSLog(@"%ld----%ld",(long)indexPath.section,(long)indexPath.row);
}
@end
