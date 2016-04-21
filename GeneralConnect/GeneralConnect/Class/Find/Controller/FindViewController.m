//
//  FindViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "FindViewController.h"
#import "SearchViewController.h"
#import "RJNavViewController.h"

@interface FindViewController ()
@property (weak,nonatomic)UIView *screenView;
@property (weak,nonatomic)UIButton *selectedBtn;
@end

@implementation FindViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];

    //创建导航栏右搜索按钮
    [self setupSearchView];

    //创建筛选视图
    [self setupScreenView];
    
}

- (void)setupScreenView{
    NSArray *screenBtnArray = @[@"全国",@"智能排序",@"筛选"];
    UIView *screenView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    screenView.backgroundColor = [UIColor whiteColor];
//    [self.tabBarController.view addSubview:screenView];
    self.screenView = screenView;

    for (int i = 0; i < 3; i++) {
        UIButton *screenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        screenBtn.tag = i;
        [screenBtn setTitle:screenBtnArray[i] forState:UIControlStateNormal];
        screenBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [screenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [screenBtn setTitleColor:[UIColor colorWithRed:118/255.0 green:215/255.0 blue:254/255.0 alpha:1.0] forState:UIControlStateSelected];
        CGFloat screenBtnW = self.view.frame.size.width/3;
        CGFloat screenBtnY = 0;
        CGFloat screenBtnH = screenView.frame.size.height;
        CGFloat screenBtnX = i * screenBtnW;
        screenBtn.frame = CGRectMake(screenBtnX, screenBtnY, screenBtnW, screenBtnH);
        [screenBtn addTarget:self action:@selector(screenBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [screenView addSubview:screenBtn];
    }
    //加到TarBarView上面，否则会随view滚动
//    [self.tabBarController.view insertSubview:self.screenView atIndex:1];    //插入1这个位置，不会影响其他TarBarView上的视图
    [self.navigationController.view addSubview:screenView];
    
}

- (void)setupSearchView{
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 22, 20);
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

- (void)screenBtnAction:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

//搜索按钮点击
- (void)searchBtnAction{
    SearchViewController *searchVc = [[SearchViewController alloc] init];
    searchVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVc animated:YES];
}

@end
