//
//  RegisterViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *ifNum;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *chooseW;
@property (weak, nonatomic) IBOutlet UIButton *chooseG;
- (IBAction)sureAction;
- (IBAction)getIfNum;
- (IBAction)sureRegister;
- (IBAction)chooseWAction;
- (IBAction)chooseGAction;

@end

@implementation RegisterViewController

- (void)viewWillAppear:(BOOL)animated{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
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

//注册
- (IBAction)sureRegister {
}

//选中网红身份
- (IBAction)chooseWAction {
    _chooseW.selected = !_chooseW.selected;
    if (_chooseG.selected == YES) {
        _chooseG.selected = NO;
    }
}

//选择广告商身份
- (IBAction)chooseGAction {
    _chooseG.selected = !_chooseG.selected;
    if (_chooseW.selected == YES) {
        _chooseW.selected = NO;
    }
}

//返回
- (void)leftBtnAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
