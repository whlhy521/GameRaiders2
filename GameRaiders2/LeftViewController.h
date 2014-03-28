//
//  LeftViewController.h
//  GameRaiders2
//
//  Created by Noodles Wang on 3/25/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController
{
    IBOutlet UIView *homeView;
    IBOutlet UIView *inviteView;
    IBOutlet UIView *feedbackView;
    IBOutlet UIView *aboutView;
    IBOutlet UIView *recommandView;
}
- (void)menuClick:(UIView *)action;

@end
