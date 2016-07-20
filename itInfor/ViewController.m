//
//  ViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/15.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MeViewController.h"
#import "FindViewController.h"
#import "ContactViewController.h"
#import "MessageViewController.h"
#import "CommonDefines.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //设置状态栏为白色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIWindow *window = app.window;
    
    window.backgroundColor = [UIColor whiteColor];
    
    UITabBarController *tb = [[UITabBarController alloc] init];
    
    
    window.rootViewController = tb;
    
    
    
    
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
    
    
//    findVC.tabBarItem.badgeValue = @"1";
    
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

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
