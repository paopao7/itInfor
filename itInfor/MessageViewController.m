//
//  MessageViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/19.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "MessageViewController.h"

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置状态栏背景色为黑色
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"微信";

    UIButton *add_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    add_btn.frame = CGRectMake(300, 10, 24, 24);
    
    [add_btn setBackgroundImage:[UIImage imageNamed:@"barbuttonicon_add"] forState:UIControlStateNormal];
    
    UIBarButtonItem *right_bar_item = [[UIBarButtonItem alloc] initWithCustomView:add_btn];
    
    self.navigationItem.rightBarButtonItem = right_bar_item;
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

@end
