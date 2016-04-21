//
//  FindViewController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/18.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "FindViewController.h"
#import "SearchViewController.h"
#import "RJNavViewController.h"
#import "plusView.h"
#import "FireViewController.h"

@interface FindViewController ()
@property (weak,nonatomic)UIView *screenView;
@property (weak,nonatomic)UIButton *selectedBtn;
@property (weak,nonatomic)UIView *maskView;
@property (weak,nonatomic)UIView *plusView;
@end

@implementation FindViewController

- (void)viewWillAppear:(BOOL)animated{
    self.screenView.hidden = NO; //设置筛选视图显示
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:247/255.0 alpha:1.0];
    
    //创建导航栏右搜索按钮
    [self setupSearchView];

    //创建筛选视图
    [self setupScreenView];
    
    //创建加号视图
    [self setupPlusView];

    //接收通知，弹出加号视图或发动态控制器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentTextPlus) name:@"presentPlus" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fireNew) name:@"fire" object:nil];

}

//初始化加号视图
- (void)setupPlusView{
    [self setupMaskView];
    
    plusView *myplusView = [[NSBundle mainBundle] loadNibNamed:@"plusView" owner:self options:nil].lastObject;
    myplusView.frame = CGRectMake(0, self.tabBarController.view.bounds.size.height, self.view.frame.size.width, 200);
//    [self.view insertSubview:myplusView aboveSubview:self.maskView];
    [self.tabBarController.view addSubview:myplusView];
    self.plusView = myplusView;
}

//遮罩视图
- (void)setupMaskView{
    UIView *maskView = [[UIView alloc] initWithFrame:self.view.frame];
//    self.tabBarController.view.userInteractionEnabled = NO;
    maskView.backgroundColor = [UIColor whiteColor];
    [self.tabBarController.view addSubview:maskView];
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

//创建筛选视图
- (void)setupScreenView{
    NSArray *screenBtnArray = @[@"全国",@"智能排序",@"筛选"];
    UIView *screenView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40)];
    screenView.backgroundColor = [UIColor whiteColor];
//    [self.tabBarController.view addSubview:screenView];
    self.screenView = screenView;

    for (int i = 0; i < 3; i++) {
        UIButton *screenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        screenBtn.tag = i;
        [screenBtn setTitle:screenBtnArray[i] forState:UIControlStateNormal];
        screenBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [screenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [screenBtn setTitleColor:[UIColor colorWithRed:118/255.0 green:215/255.0 blue:254/255.0 alpha:1.0] forState:UIControlStateSelected];
        CGFloat screenBtnW = self.view.frame.size.width/3;
        CGFloat screenBtnY = 0;
        CGFloat screenBtnH = screenView.frame.size.height;
        CGFloat screenBtnX = i * screenBtnW;
        screenBtn.frame = CGRectMake(screenBtnX, screenBtnY, screenBtnW, screenBtnH);
        [screenBtn addTarget:self action:@selector(screenBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [screenView addSubview:screenBtn];
    }
    //加到TarBarView上面，否则会随view滚动
//    [self.tabBarController.view insertSubview:self.screenView atIndex:1];    //插入1这个位置，不会影响其他TarBarView上的视图
    [self.navigationController.view addSubview:screenView];
    
}

//创建导航栏右搜索按钮
- (void)setupSearchView{
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 22, 20);
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

//筛选按钮点击事件
- (void)screenBtnAction:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

//搜索按钮点击
- (void)searchBtnAction{
    self.screenView.hidden = YES;
    SearchViewController *searchVc = [[SearchViewController alloc] init];
    searchVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:searchVc animated:YES];
}


/*通知方法*/
//动画弹出加号按钮视图
- (void)presentTextPlus{
    self.maskView.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        self.plusView.transform = CGAffineTransformMakeTranslation(0, -(self.plusView.frame.size.height + self.tabBarController.tabBar.frame.size.height));
    } completion:nil];
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
    self.tabBarController.tabBar.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.0 options:0 animations:^{
        self.plusView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        self.maskView.hidden = YES;
    }];
}
@end
