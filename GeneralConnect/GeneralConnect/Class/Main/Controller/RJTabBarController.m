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
#import "plusView.h"
#import "FireViewController.h"

@interface RJTabBarController ()
@property (weak,nonatomic)RJTarBar *customTabar;
@property (weak,nonatomic)UIView *maskView;
@property (weak,nonatomic)UIView *plusView;

@end

@implementation RJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTarBar];

    [self setupChildVc];
    
    [self setupPlusView];
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(chooseController:) name:@"indexChange" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentTextPlus) name:@"presentPlus" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fireNew) name:@"fire" object:nil];
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

//初始化加号视图
- (void)setupPlusView{
    [self setupMaskView];
    
    plusView *myplusView = [[NSBundle mainBundle] loadNibNamed:@"plusView" owner:self options:nil].lastObject;
    myplusView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.frame.size.width, 200);
    [self.view insertSubview:myplusView aboveSubview:self.maskView];
    self.plusView = myplusView;
}

//遮罩视图
- (void)setupMaskView{
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.frame];
    self.tabBarController.view.userInteractionEnabled = NO;
    maskView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:maskView];
//    [self.view insertSubview:maskView aboveSubview:self.tabBar];
    [self.view addSubview:maskView];
    maskView.hidden = YES;
    self.maskView = maskView;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewClick)];
    [self setupMaskBgView];
    [_maskView addGestureRecognizer:tap];
}

- (void)setupMaskBgView{
    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"text"]];
    bgView.frame = self.maskView.frame;
    [self.maskView addSubview:bgView];
    
    //取消按钮
    UIButton *Xbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    Xbtn.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    [Xbtn setImage:[UIImage imageNamed:@"×"] forState:UIControlStateNormal];
    [Xbtn setImage:[UIImage imageNamed:@"x1.jpg"] forState:UIControlStateHighlighted];
    [Xbtn addTarget:self action:@selector(maskViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.maskView addSubview:Xbtn];
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

//动画弹出加号按钮视图
- (void)presentTextPlus{
    self.maskView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.plusView.transform = CGAffineTransformMakeTranslation(0, -(self.plusView.frame.size.height + self.tabBar.frame.size.height));
    } completion:nil];
}

//切换控制器
- (void)chooseController:(NSNotification *)not{
    self.selectedIndex = [not.object integerValue];
}

//跳转发布控制器
- (void)fireNew{
    [self maskViewClick];
    FireViewController *fireVc = [[FireViewController alloc] init];
    RJNavViewController *nav = [[RJNavViewController alloc] initWithRootViewController:fireVc];
    [self presentViewController:nav animated:YES completion:nil];
}

//隐藏加号视图
- (void)maskViewClick{
    [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
        self.plusView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.maskView.hidden = YES;
    }];
}
@end
