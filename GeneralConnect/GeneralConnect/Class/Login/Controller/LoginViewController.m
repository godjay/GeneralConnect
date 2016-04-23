//
//  LoginViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "LoginViewController.h"
#import "RJTabBarController.h"
#import "RegisterViewController.h"
#import "RJNavViewController.h"
#import "ForgetViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *rememberBtn;

- (IBAction)loginAction;
- (IBAction)rememberPassWord;
- (IBAction)registerAction;
- (IBAction)forgetAction;

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated{
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

//登录
- (IBAction)loginAction {
    
    RJTabBarController *mainTarBarVc = [[RJTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTarBarVc;
    
}

//记住密码
- (IBAction)rememberPassWord {
    
    _rememberBtn.selected = !_rememberBtn.selected;
    
}

//注册
- (IBAction)registerAction {
    
    RegisterViewController *registerVc = [[RegisterViewController alloc] init];
    RJNavViewController *nav = [[RJNavViewController alloc] initWithRootViewController:registerVc];
    [self presentViewController:nav animated:YES completion:nil];
    
}


//忘记密码
- (IBAction)forgetAction {
    
    ForgetViewController *forgetVc = [[ForgetViewController alloc] init];
    RJNavViewController *nav = [[RJNavViewController alloc] initWithRootViewController:forgetVc];
    [self presentViewController:nav animated:YES completion:nil];
    
}

@end
