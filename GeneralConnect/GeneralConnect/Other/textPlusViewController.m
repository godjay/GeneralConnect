//
//  textPlusViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/13.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "textPlusViewController.h"

@interface textPlusViewController ()

@end

@implementation textPlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
