//
//  FireViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "FireViewController.h"

@interface FireViewController ()

@end

@implementation FireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
