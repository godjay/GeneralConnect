//
//  RJTarBarBtn.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/11.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJTarBarBtn.h"

@implementation RJTarBarBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
//    self.imageEdgeInsets = UIEdgeInsetsMake(5, 16, 5, 16);
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, 5, self.frame.size.width, self.frame.size.height/2 - 5);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2);
}

- (void)setHighlighted:(BOOL)highlighted{
    
}

@end
