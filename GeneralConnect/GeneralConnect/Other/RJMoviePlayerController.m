//
//  RJMoviePlayerController.m
//  GeneralConnect
//
//  Created by lirenjie on 16/4/15.
//  Copyright © 2016年 lirenjie. All rights reserved.
//

#import "RJMoviePlayerController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface RJMoviePlayerController ()
@property (strong,nonatomic)MPMoviePlayerController *movie;
@end

@implementation RJMoviePlayerController

- (MPMoviePlayerController *)movie{
    if (!_movie) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"风骚之神.mp4" withExtension:nil];
        _movie = [[MPMoviePlayerController alloc] initWithContentURL:url];
        _movie.view.frame = self.view.frame;
        _movie.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:_movie.view];
    }
    return _movie;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.movie play];
}

- (void)dealloc{
    _movie = nil;
}

@end
