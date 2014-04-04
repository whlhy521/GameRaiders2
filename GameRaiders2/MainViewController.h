//
//  MainViewController.h
//  GameRaiders2
//
//  Created by Noodles Wang on 3/25/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

@interface MainViewController : UIViewController<SlideNavigationControllerDelegate>
{
    IBOutlet UIWebView *mainWebView;
}
@end
