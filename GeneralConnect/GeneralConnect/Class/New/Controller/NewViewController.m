//
//  NewViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/25.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "NewViewController.h"
#import "RJNewView.h"

@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupNewView];
}

- (void)setupNewView{
    
    RJNewView *newView = [[RJNewView alloc] initWithFrame:self.view.frame];
    
    [self.view addSubview:newView];
    
}

@end
