//
//  MessageDetailViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/22.
//  Copyright © 2016年 钱超. All rights reserved.
//
#import "CommonDefines.h"
#import "MessageDetailViewController.h"

@implementation MessageDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"详情页面";
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

@end
