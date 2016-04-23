//
//  RJHeaderView.m
//  城市
//
//  Created by lirenjie on 16/4/20.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJHeaderView.h"
#import "RJProvince.h"

@interface RJHeaderView ()

@property (nonatomic, copy) void(^headerBlock)();

@property (weak, nonatomic) UIButton *btn;
@property (weak, nonatomic) UIButton *imageBtn;

@end

@implementation RJHeaderView

- (void)setProvince:(RJProvince *)province{
    
    _province = province;
    
    [self.btn setTitle:province.ProvinceName forState:UIControlStateNormal];
    
    //处理箭头
    if (self.province.expanded) {
        self.imageBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.imageBtn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        //添加子控件
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn = btn;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        
        //添加箭头
        UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imageBtn = imageBtn;
        imageBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageBtn.imageView.clipsToBounds = NO;
        [imageBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
        [self.contentView addSubview:imageBtn];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.btn.frame = self.bounds;
    self.imageBtn.frame = CGRectMake(self.frame.size.width - 24, (self.frame.size.height - 17)/2, 17, 17);
}

- (void)btnClick{
    
    //状态取反
    self.province.expanded = !self.province.isExpanded;
    
    if (self.headerBlock) {
        self.headerBlock();//执行self.headerBlock里面的代码
    }
}

- (void)headerClick:(void(^)())block {
    
    self.headerBlock = block;//将block的代码赋给self.headerBlock
    
    
//    block(@"这样就可以传参数了");//就会触发回调了
}

@end
