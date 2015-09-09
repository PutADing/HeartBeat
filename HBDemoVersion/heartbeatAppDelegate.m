//
//  heartbeatAppDelegate.m
//  HBDemoVersion
//
//  Created by okwei on 14-11-4.
//  Copyright (c) 2014年 heartbeat. All rights reserved.
//

#import "heartbeatAppDelegate.h"
#import "HBChatVC.h"
#import "HBDiscoverVC.h"
#import "HBShareViewController.h"
#import "HBRegisterViewController.h"
#import "HBContactsViewController.h"
#import "GDataXMLNode.h"
#import "JSON.h"

@implementation heartbeatAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    HBRegisterViewController* registerVC = [[HBRegisterViewController alloc]init];
    [self.window setRootViewController:registerVC];           //注册
    
    
    
    
    
    
    
/*
    HBChatVC * chatVC = [[HBChatVC alloc] init];                                //聊天
    HBDiscoverVC * discoverVC = [[HBDiscoverVC alloc] init];                    //发现
    HBShareViewController * shareVC = [[HBShareViewController alloc] init];     //共享
    HBContactsViewController * contactsVC = [[HBContactsViewController alloc]init];//通讯录
    
    
    //聊天
    HBBaseNavigationController * chatNavi = [[HBBaseNavigationController alloc] initWithRootViewController:chatVC];
    //发现
    HBBaseNavigationController * discoverNavi = [[HBBaseNavigationController alloc] initWithRootViewController:discoverVC];
    //共享
    HBBaseNavigationController * shareNavi = [[HBBaseNavigationController alloc] initWithRootViewController:shareVC];
    //设置
#warning wait to add
    
    HBBaseTabBarController * mainTabBarController = [[HBBaseTabBarController alloc]init];
    [mainTabBarController setViewControllers:@[chatVC,discoverVC,shareVC]];
    [mainTabBarController setViewControllers:@[shareVC,contactsVC]];
    [mainTabBarController.tabBar setHidden:YES];
    
    HBBaseNavigationController * mainNavi = [[HBBaseNavigationController alloc] initWithRootViewController:mainTabBarController];
    [mainNavi setMyTabBarController:mainTabBarController];
    [self.window setRootViewController:mainNavi];
*/
    
    
    [self.window makeKeyAndVisible];
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
