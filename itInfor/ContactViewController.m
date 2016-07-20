//
//  ContactViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/19.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "ContactViewController.h"

@implementation ContactViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.00];
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    self.title = @"通讯录";
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

@end
