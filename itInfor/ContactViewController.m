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
    
    //设置状态栏背景色为黑色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"通讯录";
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

@end
