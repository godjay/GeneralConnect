//
//  RJSettingViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/30.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJSettingViewController.h"
#import "YCSettingGroup.h"
#import "YCSettingItem.h"
#import "RJSettingCell.h"

@interface RJSettingViewController ()

@property (strong, nonatomic) NSMutableArray *groupArray;

@end

@implementation RJSettingViewController

- (NSMutableArray *)groupArray{
    if (!_groupArray) {
        _groupArray = [NSMutableArray array];
    }
    return _groupArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];
    self.title = @"设置";
    self.tableView.scrollEnabled = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupGroup0];
    [self setupGroup1];
    
    [self.tableView registerClass:[RJSettingCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
    
    [self setupItem];
    
    [self setupView];
}

- (void)setupGroup0{
    
    YCSettingItem *item0 = [YCSettingItem itemWithIcon:nil title:@"帐号安全" destVcClass:nil];
    YCSettingItem *item1 = [YCSettingItem itemWithIcon:nil title:@"消息通知" destVcClass:nil];
    YCSettingGroup *group0 = [[YCSettingGroup alloc] init];
    
    group0.items = @[item0,item1];
    [self.groupArray addObject:group0];
}

- (void)setupGroup1{
    
    YCSettingItem *item0 = [YCSettingItem itemWithIcon:nil title:@"清理缓存" destVcClass:nil];
    YCSettingItem *item1 = [YCSettingItem itemWithIcon:nil title:@"关于广义互联" destVcClass:nil];
    YCSettingGroup *group1 = [[YCSettingGroup alloc] init];
    
    group1.items = @[item0,item1];
    [self.groupArray addObject:group1];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _groupArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    YCSettingGroup *group = _groupArray[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPathP{
    
    YCSettingGroup *group = _groupArray[indexPathP.section];
    YCSettingItem *item = group.items[indexPathP.row];
    
    RJSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.text = item.title;
    
    if (indexPathP.section == 0 && indexPathP.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)setupView{
    
    UIButton *outLoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    outLoginBtn.frame = CGRectMake(0, self.view.bounds.size.height - 44 - 40, self.view.bounds.size.width, 44);
    
    [outLoginBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [outLoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    outLoginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    outLoginBtn.backgroundColor = [UIColor colorWithRed:3/255.0 green:160/255.0 blue:235/255.0 alpha:1.0];
    
    [outLoginBtn addTarget:self action:@selector(outLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:outLoginBtn aboveSubview:self.tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1){
        return 5;
    }
    return 0;
}

- (void)setupItem{
    
    //创建导航栏左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)outLoginAction{
    NSLog(@"000");
}


@end
