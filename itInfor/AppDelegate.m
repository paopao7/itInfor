//
//  AppDelegate.m
//  itInfor
//
//  Created by 钱超 on 16/7/15.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "AppDelegate.h"
#import "MeViewController.h"
#import "FindViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "CommonDefines.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tb = [[UITabBarController alloc] init];
    
    
    self.window.rootViewController = tb;
    
    
    
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    
    //创建对应的导航控制器
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    UIImage *message_normal = [[UIImage imageNamed:@"tabbar_mainframe"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *message_select = [[UIImage imageNamed:@"tabbar_mainframeHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    messageVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"微信" image:message_normal selectedImage:message_select];
    
    //设置被选中时tabbaritem的文字的颜色
    [messageVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
    
    
    
    
    ContactViewController *contactVC = [[ContactViewController alloc] init];
    
    //创建对应的导航控制器
    UINavigationController *contactNav = [[UINavigationController alloc] initWithRootViewController:contactVC];
    
    UIImage *contact_normal = [[UIImage imageNamed:@"tabbar_contacts"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *contact_select = [[UIImage imageNamed:@"tabbar_contactsHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    contactVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"联系人" image:contact_normal selectedImage:contact_select];
    
    //设置被选中时tabbaritem的文字的颜色
    [contactVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
    
    

    FindViewController *findVC = [[FindViewController alloc] init];
    
    //创建对应的导航控制器
    UINavigationController *findNav = [[UINavigationController alloc] initWithRootViewController:findVC];
    
    UIImage *find_normal = [[UIImage imageNamed:@"tabbar_discover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *find_select = [[UIImage imageNamed:@"tabbar_discoverHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    findVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:find_normal selectedImage:find_select];
    
    
    findVC.tabBarItem.badgeValue = @"1";
    
    //设置被选中时tabbaritem的文字的颜色
    [findVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
    


    MeViewController *meVC = [[MeViewController alloc] init];
    
    //创建对应的导航控制器
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    
    UIImage *me_normal = [[UIImage imageNamed:@"tabbar_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *me_select = [[UIImage imageNamed:@"tabbar_meHL"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    meVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:me_normal selectedImage:me_select];
    
    //设置被选中时tabbaritem的文字的颜色
    [meVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : Global_tintColor} forState:UIControlStateSelected];
    
    
    

    //将导航控制器加入到数组中
    NSArray *controllerArray = [[NSArray alloc] initWithObjects:messageNav,contactNav,findNav,meNav,nil];
    
    //导航控制器的子视图为加入数组的四个导航控制器
    tb.viewControllers = controllerArray;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
