//
//  RJtableView.m
//  CityChoose
//
//  Created by lirenjie on 16/4/21.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJtableView.h"
#import "RJCity.h"
#import "RJProvince.h"
#import "RJHeaderView.h"
#import "RJTableViewCell.h"

static NSString *const headerResuseIdentifier = @"headerResuseIdentifier";

@interface RJtableView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic)RJTableViewCell *lastCell;
@end

@implementation RJtableView

- (NSArray *)groups{
    
    if (!_groups) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Provineces.plist" ofType:nil]];
        NSMutableArray *tmpGroups = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray) {
            
            RJProvince *province = [RJProvince groupWithDic:dict];
            
            [tmpGroups addObject:province];
        }
        
        _groups = tmpGroups;
    }
    return _groups;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame style:UITableViewStylePlain]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.sectionHeaderHeight = 44;
        
        [self registerClass:[RJTableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
        [self registerClass:[RJHeaderView class] forHeaderFooterViewReuseIdentifier:headerResuseIdentifier];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    RJProvince *province = self.groups[section];
    return (province.isExpanded ? province.cities.count : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RJProvince *province = self.groups[indexPath.section];
    RJCity *city = province.cities[indexPath.row];
    
    RJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.text = city.CityName;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    RJTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RJProvince *province = self.groups[section];
    RJHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerResuseIdentifier];
//    header.currentSection = section;
    header.province = province;
    
    [header headerClick:^{
        [self reloadData];
    }];
    
    return header;
}

@end
