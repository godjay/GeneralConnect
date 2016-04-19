//
//  ForgetViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *ifNum;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *lookBtn;
- (IBAction)sureAction;
- (IBAction)getIfNum;
- (IBAction)sureChange;
- (IBAction)changeSecure;

@end

@implementation ForgetViewController

- (void)viewWillAppear:(BOOL)animated{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    //创建导航栏左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

//同意按钮
- (IBAction)sureAction {
    _sureBtn.selected = !_sureBtn.selected;
}

//获取验证码
- (IBAction)getIfNum {
}

//确定修改
- (IBAction)sureChange {
}

//使密码明文
- (IBAction)changeSecure {
    _lookBtn.selected = !_lookBtn.selected;
    if (_lookBtn.selected == YES) {
        self.pwd.secureTextEntry = NO;
    }else if (_lookBtn.selected == NO){
        self.pwd.secureTextEntry = YES;
    }
}

//返回
- (void)leftBtnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
