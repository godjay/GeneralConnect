//
//  RJNewView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/25.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJNewView.h"
#import "textNewCell.h"

@interface RJNewView () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation RJNewView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.rowHeight = 320;
        
        [self registerNib:[UINib nibWithNibName:@"textNewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:NSStringFromClass([self class])];
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    textNewCell *textCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    
    
    return textCell;
}

@end
