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
@property (assign, nonatomic) NSNumber *type;


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
    _sureBtn.selected = YES;
    
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
    
    if (_phoneNum.text.length != 0 && _pwd.text.length != 0) {
        
        if (_pwd.text.length >= 6) {
            
            if (_type == nil) {
                
                [ProgressHUD showError:@"请选择您的身份哦~"];
            }else{
                
                [ProgressHUD show:@"注册中.."];
                NSString *urlStr = [NSString stringWithFormat:@"%@v1/users",apiBaseURL];
                
                NSDictionary *params = @{
                                         @"password" : self.pwd.text,
                                         @"username" : self.phoneNum.text,
                                         @"type" : _type
                                         };
                
                [RJNetRequestTool PostWithURL:urlStr params:params success:^(id json) {
                    
                    [ProgressHUD dismiss];
                    NSLog(@"json    :   %@",json);

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        
                        [ProgressHUD showSuccess:@"注册成功!"];

                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            
                            [self leftBtnAction];

                        });

                    });
                    
                } failure:^(NSError *error) {
                    
                    NSLog(@"error    :   %@",error);
                    
                }];
            }
            
        }else{
            [ProgressHUD showError:@"密码最少6位哦"];
        }
        
    }else{
        [ProgressHUD showError:@"手机号或密码不能为空"];
    }
    
}

//选中网红身份
- (IBAction)chooseWAction {
    
    _chooseW.selected = !_chooseW.selected;
    
    if (_chooseG.selected == YES) {
        _chooseG.selected = NO;
    }
    
    if (_chooseW.selected == YES) {
        _type = @0;
    }else{
        _type = nil;
    }
    
}

//选择广告商身份
- (IBAction)chooseGAction {
    
    _chooseG.selected = !_chooseG.selected;
    
    if (_chooseW.selected == YES) {
        _chooseW.selected = NO;
    }
    
    if (_chooseG.selected == YES) {
        _type = @1;
    }else{
        _type = nil;
    }
}

//返回
- (void)leftBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
