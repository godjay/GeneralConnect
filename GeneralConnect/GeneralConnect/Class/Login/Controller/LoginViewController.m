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
    
    _rememberBtn.selected = [[NSUserDefaults standardUserDefaults] boolForKey:@"isRememberPwd"];
    if (_rememberBtn.selected == YES) {
        _phoneNum.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"phoneNum"];
        _pwd.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"pwd"];
    }
}

//登录
- (IBAction)loginAction {
    //跳转控制器
    RJTabBarController *mainTarBarVc = [[RJTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTarBarVc;
    /*
    if (_phoneNum.text.length != 0 && _pwd.text.length != 0) {
        
        if (_pwd.text.length >= 6) {
            
            [ProgressHUD show:@"正在登录.."];
            self.view.userInteractionEnabled = NO;  // 用户不可交互
            
            NSString *urlStr = [NSString stringWithFormat:@"%@v1/user/login",apiBaseURL];
            
            NSDictionary *dic = @{
                                  @"LoginForm[username]" : _phoneNum.text,
                                  @"LoginForm[password]" : _pwd.text,
                                  @"LoginForm[verifyCode]" : @"222"
                                  };
            
            [RJNetRequestTool PostWithURL:urlStr params:dic success:^(id json) {
                
                NSLog(@"json %@",json);
     
//                NSDictionary *data = json[@"data"];
//                NSLog(@"accessToken    :   %@",data[@"accessToken"]);  获取accessToken
     
                //记住密码
                if (_rememberBtn.selected == YES) {
                    [[NSUserDefaults standardUserDefaults] setObject:_phoneNum.text forKey:@"phoneNum"];
                    [[NSUserDefaults standardUserDefaults] setObject:_pwd.text forKey:@"pwd"];
                }else{
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phoneNum"];
                    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"pwd"];
                }
                
                [ProgressHUD dismiss];  //隐藏提示框
                self.view.userInteractionEnabled = YES;  // 用户可以交互

                //跳转控制器
                RJTabBarController *mainTarBarVc = [[RJTabBarController alloc] init];
                [UIApplication sharedApplication].keyWindow.rootViewController = mainTarBarVc;
     
            } failure:^(NSError *error) {
                
                [ProgressHUD dismiss];  //隐藏提示框
                [ProgressHUD showError:@"登录失败！"];
                self.view.userInteractionEnabled = YES;  // 用户可以交互
                NSLog(@"error %@",error);
                
            }];
        }else{
            [ProgressHUD showError:@"密码最少6位哦~"];
        }
        
    }else{
        [ProgressHUD showError:@"手机号或密码不能为空！"];
    }
    */
}

//记住密码
- (IBAction)rememberPassWord {
    
    _rememberBtn.selected = !_rememberBtn.selected;
    
    [[NSUserDefaults standardUserDefaults] setBool:_rememberBtn.selected forKey:@"isRememberPwd"];
    
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
