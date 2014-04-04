//
//  StrategyBubbleAdView.m
//  GameRaiders2
//
//  Created by Noodles Wang on 3/28/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "StrategyBubbleAdView.h"

@implementation StrategyBubbleAdView

- (id)initWithFrame:(CGRect)frame text:(NSString*)text imageURL:(NSString*)imageURL downloadURL:(NSString*)downloadURL showBtn:(BOOL)showCloseBtn showAd:(BOOL)showAD
{
    self = [super initWithFrame:frame];
    if (self) {
        _adText = text;
        _imageURL = imageURL;
        _downloadURL = downloadURL;
        _showCloseBtn = showCloseBtn;
        _showAD = showAD;
        [self downloadAdImage];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
}

#pragma mark - methods for assign AD image

- (void) downloadAdImage
{
    _adImage = [[DianJoyAsyncImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 284)];
//    _adImage.delegate = self;
    _adImage.cachesImage = YES;
    _adImage.imageURL = [NSURL URLWithString:_imageURL];
    _adImage.image = [UIImage imageNamed:@"paopaoAD.png"];
}

- (void)imageView:(DianJoyAsyncImageView *)sender failedLoadingImageFromURL:(NSURL *)url withError:(NSError *)error
{
    NSLog(@"ad view load error");
}

- (void)imageView:(DianJoyAsyncImageView *)sender loadedImage:(UIImage *)imageLoaded fromURL:(NSURL *)url
{
    NSLog(@"ad view load complete");
}

- (void)dealloc
{
    NSLog(@"dealloc");
}

@end
