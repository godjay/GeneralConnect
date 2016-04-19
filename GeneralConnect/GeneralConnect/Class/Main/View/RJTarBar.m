//
//  RJTarBar.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/11.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJTarBar.h"
#import "RJTarBarBtn.h"
@interface RJTarBar ()
@property (weak,nonatomic)UIButton *selectedBtn;
@property (strong,nonatomic)NSMutableArray *btnArray;
@property (weak,nonatomic)UIButton *plus;

@end

@implementation RJTarBar

- (NSMutableArray *)btnArray{
    if (_btnArray == nil) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        UIButton *plus = [UIButton buttonWithType:UIButtonTypeCustom];
//        [plus setTitle:@"+" forState:UIControlStateNormal];
//        [plus setBackgroundImage:[UIImage imageNamed:@"38"] forState:UIControlStateNormal];
        [plus setImage:[UIImage imageNamed:@"plus2"] forState:UIControlStateNormal];
        [plus setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateHighlighted];
        //好6啊这个属性
        plus.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.plus = plus;
        plus.bounds = CGRectMake(0, 0, 80, self.frame.size.height + 80);
        [plus addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plus];
    }
    return self;
}

- (void)plusClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"presentPlus" object:nil];
}

- (void)addTarBarButtonWithItems:(UITabBarItem *)items{
    //用items模型创建按钮
    RJTarBarBtn *btn = [RJTarBarBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitle:items.title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:3/255.0 green:203/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateSelected];
    [btn setImage:items.image forState:UIControlStateNormal];
    [btn setImage:items.selectedImage forState:UIControlStateSelected];

    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    
    [self.btnArray addObject:btn];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.plus.center = CGPointMake(self.center.x, self.center.y);
    for (int i = 0; i < self.btnArray.count; i++ ) {
        UIButton *btn = self.btnArray[i];
        CGFloat btnW = (self.frame.size.width - self.plus.frame.size.width)/self.btnArray.count;
        CGFloat btnX = i * btnW;
        if (i >= self.btnArray.count/2) {
            btnX = btnX + self.plus.frame.size.width;
        }
        btn.frame = CGRectMake(btnX, 0, btnW, self.frame.size.height);
        btn.tag = i;
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:self.btnArray[i]];
        }
    }
}

- (void)btnClick:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    NSNumber *num = [NSNumber numberWithInteger:btn.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"indexChange" object:num];
}
@end
