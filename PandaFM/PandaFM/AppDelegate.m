//
//  AppDelegate.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/20.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "AppDelegate.h"
#import "LJ_FoundViewController.h"
#import "LJ_DownloadToListenViewController.h"
#import "LJ_subscribeToListenViewController.h"
#import "LJ_MyViewController.h"
#import "LJ_Play_ViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tabbar_find_n"], [UIImage imageNamed:@"tabbar_sound_n"], [UIImage imageNamed:@"tabbar_download_n"], [UIImage imageNamed:@"tabbar_me_n"], nil];
    NSMutableArray *selectedArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tabbar_find_h"], [UIImage imageNamed:@"tabbar_sound_h"], [UIImage imageNamed:@"tabbar_download_h"], [UIImage imageNamed:@"tabbar_me_h"], nil];
    
    LJ_FoundViewController * findVC = [[LJ_FoundViewController alloc]init];
    LJ_subscribeToListenViewController * subVC = [[LJ_subscribeToListenViewController alloc]init];
    LJ_DownloadToListenViewController * downVC = [[LJ_DownloadToListenViewController alloc]init];
    LJ_MyViewController *mineVC = [[LJ_MyViewController alloc]init];
    
    UINavigationController *naviFind = [[UINavigationController alloc]initWithRootViewController:findVC];
    UINavigationController *naviSub = [[UINavigationController alloc]initWithRootViewController:subVC];
    UINavigationController *naviDown = [[UINavigationController alloc]initWithRootViewController:downVC];
    UINavigationController *naviMine = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    
    self.tabBar = [[XQ_TabBarViewController alloc]initWithTabBarSelectedImages:selectedArray normalImages:array titles:nil];
    _tabBar.viewControllers = @[naviFind, naviSub, naviDown, naviMine];
    _tabBar.textColor = [UIColor colorWithRed:0.92 green:0.33 blue:0.20 alpha:1.00];
    _tabBar.showCenterItem = YES;
    
    _tabBar.centerItemImage = [UIImage imageNamed:@"tabbar_sound_n-1"];
    //    _tabBar.tabBarItem.image = [[UIImage imageNamed:@"tabbar_bg"] imageWithRenderingMode:1];
    
    _tabBar.XQ_centerViewController = [[LJ_Play_ViewController alloc] init];
    _window.rootViewController = _tabBar;
    
    [self.window makeKeyAndVisible];
    


    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
