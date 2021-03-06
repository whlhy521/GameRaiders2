//
//  StrategyBubbleAdView.h
//  GameRaiders2
//
//  Created by Noodles Wang on 3/28/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DianJoyAsyncImageView.h"

@interface StrategyBubbleAdView : UIView <DianJoyAsyncImageViewDelegate>
{
    NSString *_adText;
    NSString *_imageURL;
    NSString *_downloadURL;
    BOOL     _showCloseBtn;
    BOOL     _showAD;
    DianJoyAsyncImageView *_adImage;
}
- (id)initWithFrame:(CGRect)frame text:(NSString*)text imageURL:(NSString*)imageURL downloadURL:(NSString*)downloadURL showBtn:(BOOL)showCloseBtn showAd:(BOOL)showAD;
@end
