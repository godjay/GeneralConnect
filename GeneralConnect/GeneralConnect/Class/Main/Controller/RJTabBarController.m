//
//  RJTabBarController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/11.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJTabBarController.h"
#import "FindViewController.h"
#import "NewViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "RJTarBar.h"
#import "RJNavViewController.h"

@interface RJTabBarController ()
@property (weak,nonatomic)RJTarBar *customTabar;


@end

@implementation RJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTarBar];

    [self setupChildVc];
    
    //接收通知---切换控制器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chooseController:) name:@"indexChange" object:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //移除系统tarBarBtn
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
}


- (void)setupTarBar{
    RJTarBar *customTabar = [[RJTarBar alloc] init];
    customTabar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabar];
    self.customTabar = customTabar;
}

//添加子控制器
- (void)setupChildVc{
    [self addChildViewController:[[FindViewController alloc] init] title:@"发现" iconName:@"find" selectedImageName:@"find2"];
    [self addChildViewController:[[NewViewController alloc] init] title:@"动态圈" iconName:@"wanghongquan" selectedImageName:@"wanghongquan2"];
    [self addChildViewController:[[MessageViewController alloc] init] title:@"消息" iconName:@"news" selectedImageName:@"news2"];
    [self addChildViewController:[[MineViewController alloc] init] title:@"我的" iconName:@"mine" selectedImageName:@"mine2"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title iconName:(NSString *)iconName selectedImageName:(NSString *)selectedImageName{
    childController.title = title;
    childController.tabBarItem.image = [UIImage imageNamed:iconName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    RJNavViewController *nav = [[RJNavViewController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
    //给自定义的tarbar传递模型数据
    [self.customTabar addTarBarButtonWithItems:childController.tabBarItem];
}

/*通知方法*/
//切换控制器
- (void)chooseController:(NSNotification *)not{
    self.selectedIndex = [not.object integerValue];
}


@end
