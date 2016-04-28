//
//  MineViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/28.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "MineViewController.h"
#import "RJMineView.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];
    self.navigationController.navigationBarHidden = YES;
    
    [self setupMineView];
}

- (void)setupMineView{
    
    RJMineView *mineView = [[RJMineView alloc] initWithFrame:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarController.tabBar.bounds.size.height + 20)];
    
    [self.view addSubview:mineView];
}

@end
