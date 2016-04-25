//
//  RJScrView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/22.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJScrView.h"

@interface RJScrView ()

@property (weak, nonatomic) IBOutlet UIView *oneView;
@property (weak, nonatomic) IBOutlet UIView *twoView;
@property (weak, nonatomic) IBOutlet UIButton *oneBu;
@property (weak, nonatomic) IBOutlet UIButton *oneNan;
@property (weak, nonatomic) IBOutlet UIButton *oneNv;

@property (weak, nonatomic) IBOutlet UIButton *twoBu;
@property (weak, nonatomic) IBOutlet UIButton *twoWen;
@property (weak, nonatomic) IBOutlet UIButton *twoEr;
@property (weak, nonatomic) IBOutlet UIButton *twoBiao;
@property (weak, nonatomic) IBOutlet UIButton *twoMo;
@property (weak, nonatomic) IBOutlet UIButton *twoYing;
@property (weak, nonatomic) IBOutlet UIButton *twoE;
@property (weak, nonatomic) IBOutlet UIButton *twoChong;
@property (weak, nonatomic) IBOutlet UIButton *twoTure;

@property (strong, nonatomic) NSArray *btnArray;

@property (weak, nonatomic) UIButton *selectedBtn1;
@property (weak, nonatomic) UIButton *selectedBtn2;

@property (copy, nonatomic) void (^trueClick)();


@end

@implementation RJScrView

- (NSArray *)btnArray{
    if (!_btnArray) {
        _btnArray = [NSArray array];
    }
    return _btnArray;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    
    return self;
}


//在这里初始化按钮
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    NSArray *btnArray = [NSArray arrayWithObjects:self.oneBu,self.oneNan,self.oneNv,self.twoBu,self.twoWen,self.twoEr,self.twoBiao,self.twoMo,self.twoYing,self.twoE,self.twoChong,self.twoTure, nil];
    self.btnArray = btnArray;
    
    for (int i = 0; i < btnArray.count; i++) {
        UIButton *btn = btnArray[i];
        btn.tag = i;
        
        btn.layer.borderColor = [UIColor colorWithRed:155/255.0 green:155/255.0 blue:155/255.0 alpha:0.5].CGColor;
        
        if (i == _btnArray.count - 2) {
            btn.layer.borderColor = [UIColor colorWithRed:55/255.0 green:200/255.0 blue:240/255.0 alpha:1.0].CGColor;
        }else if (i == _btnArray.count - 1){
            [btn setBackgroundColor:[UIColor colorWithRed:48/255.0 green:203/255.0 blue:255/255.0 alpha:1.0]];
        }
        
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        
        [btn addTarget:self action:@selector(scrBtnAction:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag == 0) {
            _selectedBtn1 = btn;
            _selectedBtn1.selected = YES;
        }else if (btn.tag == 3) {
            _selectedBtn2 = btn;
            _selectedBtn2.selected = YES;
        }
            
    }
    
}

- (void)scrBtnAction:(UIButton *)btn{
    
    if (btn.tag >= 0 && btn.tag <= 2) {    //性别
        _selectedBtn1.selected = NO;
        btn.selected = YES;
        _selectedBtn1 = btn;
    }else if (btn.tag >= 3 && btn.tag <= 9){    //风格
        _selectedBtn2.selected = NO;
        btn.selected = YES;
        _selectedBtn2 = btn;
    }else if (btn.tag == _btnArray.count - 2){   //重置
        _selectedBtn1.selected = NO;
        _selectedBtn2.selected = NO;
        
        _selectedBtn1 = _oneBu;
        _selectedBtn1.selected = YES;
        _selectedBtn2 = _twoBu;
        _selectedBtn2.selected = YES;
    }else if (btn.tag == _btnArray.count - 1){   //确定
        //...
        if (self.trueClick) {
            self.trueClick();
        }
    }
    
}

- (void)trueClick:(void (^)())block{
    self.trueClick = block;
}

@end
