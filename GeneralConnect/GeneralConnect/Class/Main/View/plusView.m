//
//  plusView.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/19.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "plusView.h"

@interface plusView ()
- (IBAction)fireBtnAction;

@end

@implementation plusView

//发动态
- (IBAction)fireBtnAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fire" object:nil];
}

@end
