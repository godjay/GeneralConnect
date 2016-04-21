//
//  SearchViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航栏左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;

    //创建右边搜索按钮
    
    //搜索控件
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.placeholder = @"搜索红人或通告";
    self.navigationItem.titleView = searchBar;
}

- (void)leftBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
