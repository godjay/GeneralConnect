//
//  RJNavViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/15.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJNavViewController.h"

@interface RJNavViewController ()

@end

@implementation RJNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


@end
