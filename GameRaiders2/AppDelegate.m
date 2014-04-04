//
//  AppDelegate.m
//  GameRaiders2
//
//  Created by Noodles Wang on 3/25/14.
//  Copyright (c) 2014 Noodles Wang. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "SlideNavigationController.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import <AdSupport/AdSupport.h>
#import "StrategyBubbleAdView.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self assignNavigationBar];
//    [self insertAd];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    
    SlideNavigationController *snController = [SlideNavigationController sharedInstance];
    LeftViewController *lvController = (LeftViewController*)[mainStoryboard instantiateViewControllerWithIdentifier:@"LeftViewController"];
    snController.leftMenu = lvController;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setImage:[UIImage imageNamed:@"ic_menu"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleRightMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    [SlideNavigationController sharedInstance].rightBarButtonItem = rightBarButtonItem;
    [SlideNavigationController sharedInstance].menuRevealAnimator = [[SlideNavigationContorllerAnimatorScale alloc] init];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self appStatistics];
    [self addLoadingView];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - self methods

/**
 *  针对ios 7和ios 6配置不同的导航条image
 */
- (void)assignNavigationBar
{
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0 ) {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_img_ios7"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigation_img"] forBarMetrics:UIBarMetricsDefault];
    }
}

/**
 *  插屏广告
 */
- (void)insertAd
{
    NSURL *url = [NSURL URLWithString:DIANJOY_BUBBLE_AD_URL];
    ASIHTTPRequest *httpRequest = [[ASIHTTPRequest alloc] initWithURL:url];
    httpRequest.delegate = self;
    httpRequest.timeOutSeconds = 10;
    httpRequest.didFinishSelector = @selector(requestFinished1:);
    httpRequest.didFailSelector = @selector(requestFailed1:);
    [httpRequest startAsynchronous];
}

/**
 *  请求统计接口
 */
- (void)appStatistics
{
    NSString *packageName = [[NSBundle mainBundle] bundleIdentifier];
    NSString *osVersion = [[UIDevice currentDevice] systemVersion];
    NSString *model = [[UIDevice currentDevice] model];
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString *stringURL = [NSString stringWithFormat:@"%@pack_name=%@&version=%@&model=%@&idfa=%@",DIANJOY_THIS_APP_STATISTICS_URL, packageName, osVersion, model, idfa];
    NSURL *url = [NSURL URLWithString:stringURL];
    ASIHTTPRequest *httpRequest = [[ASIHTTPRequest alloc] initWithURL:url];
    httpRequest.timeOutSeconds = 10;
    [httpRequest startAsynchronous];
}
/**
 *  自定义启动页
 */
- (void)addLoadingView
{
    UIView *loadingView = [[[NSBundle mainBundle] loadNibNamed:@"LoadingView" owner:self options:nil] lastObject];
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    [keyWindow.rootViewController.view insertSubview:loadingView atIndex:100];
    
    [self performSelector:@selector(removeLodingView:) withObject:loadingView afterDelay:2.3];
}
- (void)removeLodingView:(UIView *)loadingView
{
    [UIView animateWithDuration:0.5f animations:^{
        loadingView.alpha = 0.3;
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}

#pragma mark - insert ad request delegate

- (void)requestFinished1:(ASIHTTPRequest *)request
{
    NSData *responseData = request.responseData;
    NSDictionary *data = nil;
    data = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    StrategyBubbleAdView *bubbleAdView = [[StrategyBubbleAdView alloc] initWithFrame:[[UIApplication sharedApplication] keyWindow].frame text:[data objectForKey:@"ad_text"] imageURL:[data objectForKey:@"ad_url"] downloadURL:[data objectForKey:@"appstore_url"] showBtn:[[data objectForKey:@"is_close"] boolValue] showAd:[[data objectForKey:@"status"] boolValue]];
}
- (void)requestFailed1:(ASIHTTPRequest *)request
{
    NSLog(@"requestFailed1");
}
@end
