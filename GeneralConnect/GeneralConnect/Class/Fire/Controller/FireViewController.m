//
//  FireViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/19.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "FireViewController.h"

@interface FireViewController ()

@property (weak, nonatomic) IBOutlet UIButton *fireBtn;

@property (weak, nonatomic) IBOutlet UITextView *myTextView;

@end

@implementation FireViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"发布动态";
    
    self.navigationController.navigationBar.translucent = YES;
    
    //创建导航栏左边按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.fireBtn.backgroundColor = [UIColor colorWithRed:3/255.0 green:160/255.0 blue:235/255.0 alpha:1.0];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.myTextView endEditing:YES];
    
}

//返回
- (void)leftBtnAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
