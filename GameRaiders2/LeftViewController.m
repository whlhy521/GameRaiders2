//
//  LeftViewController.m
//  GameRaiders2
//
//  Created by Noodles Wang on 3/25/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "LeftViewController.h"
#import "SlideNavigationController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];
    UITapGestureRecognizer *tapGestureRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];
    UITapGestureRecognizer *tapGestureRecognizer3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];
    UITapGestureRecognizer *tapGestureRecognizer4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];
    UITapGestureRecognizer *tapGestureRecognizer5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(menuClick:)];
    [homeView addGestureRecognizer:tapGestureRecognizer1];
    [inviteView addGestureRecognizer:tapGestureRecognizer2];
    [feedbackView addGestureRecognizer:tapGestureRecognizer3];
    [aboutView addGestureRecognizer:tapGestureRecognizer4];
    [recommandView addGestureRecognizer:tapGestureRecognizer5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - view action call methods

- (void)menuClick:(UIGestureRecognizer *)gestureRecognizer
{
    long tag = [gestureRecognizer view].tag;
    UIViewController *viewController;
    UIStoryboard *mainboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    switch (tag) {
        case 1:
            viewController = [mainboard instantiateViewControllerWithIdentifier:@"MainViewController"];
            break;
        case 2:
            viewController = [mainboard instantiateViewControllerWithIdentifier:@"InviteFriendsViewController"];
            break;
        case 3:
            viewController = [mainboard instantiateViewControllerWithIdentifier:@"FeedbackViewController"];
            break;
        case 4:
            viewController = [mainboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
            break;
        case 5:
            viewController = [mainboard instantiateViewControllerWithIdentifier:@"AppRecommandViewController"];
            break;
        default:
            break;
    }
    [[SlideNavigationController sharedInstance] switchToViewController:viewController withCompletion:nil];
}

@end
