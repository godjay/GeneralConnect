//
//  MessageViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/25.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "MessageViewController.h"
#import "RJMessageView.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];
    
    [self setupRightItem];       //创建导航栏右边举报按钮

    [self setupMessageView];
}

- (void)setupMessageView{
    
    RJMessageView *messageView = [[NSBundle mainBundle] loadNibNamed:@"RJMessageView" owner:self options:nil].lastObject;
    messageView.frame = CGRectMake(0, 64, self.view.bounds.size.width, 240);
    
    [self.view addSubview:messageView];
    
}

- (void)setupRightItem{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 30, 6);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

//举报
- (void)rightBtnAction{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"举报" style:0 handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action1];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
