//
//  SharkViewController.m
//  itInfor
//
//  Created by 钱超 on 16/10/11.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "CommonDefines.h"
#import "SharkViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SharkViewController ()

@end

@implementation SharkViewController

- (void) function_init{
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    // 设置允许摇一摇功能
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = YES;
    
    // 并让自己成为第一响应者
    [self becomeFirstResponder];
    
    // Do any additional setup after loading the view.
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"摇一摇";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.18 green:0.19 blue:0.20 alpha:1.00];
    
    UIImageView *backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 200, 150, 166)];
    
    backImageView.image = [UIImage imageNamed:@"Shake_Logo_Up"];
    
    [self.view addSubview:backImageView];
    
    
    
    UIImageView *sharkPeople = [[UIImageView alloc] initWithFrame:(CGRectMake(50, 500, 38, 34))];
    
    sharkPeople.image = [UIImage imageNamed:@"Shake_icon_peopleHL"];
    
    [self.view addSubview:sharkPeople];
    
    
    
    UILabel *peopleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(58, 530, 38, 34))];
    
    peopleLabel.text = @"人";
    
    peopleLabel.textColor = [UIColor greenColor];
    
    peopleLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    [self.view addSubview:peopleLabel];
    
    
    
    UIImageView *sharkMusic = [[UIImageView alloc] initWithFrame:(CGRectMake(141, 500, 38, 34))];
    
    sharkMusic.image = [UIImage imageNamed:@"Shake_icon_music"];
    
    [self.view addSubview:sharkMusic];
    
    
    
    UILabel *musicLabel = [[UILabel alloc] initWithFrame:(CGRectMake(146, 530, 38, 34))];
    
    musicLabel.text = @"音乐";
    
    musicLabel.textColor = [UIColor whiteColor];
    
    musicLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    [self.view addSubview:musicLabel];
    
    
    
    
    UIImageView *sharkTV = [[UIImageView alloc] initWithFrame:(CGRectMake(232, 500, 38, 34))];
    
    sharkTV.image = [UIImage imageNamed:@"Shake_icon_tv"];
    
    [self.view addSubview:sharkTV];
    
    
    
    UILabel *tvLabel = [[UILabel alloc] initWithFrame:(CGRectMake(237, 530, 38, 34))];
    
    tvLabel.text = @"电视";
    
    tvLabel.textColor = [UIColor whiteColor];
    
    tvLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    [self.view addSubview:tvLabel];
    
    
}

- (void)viewDidLoad {
    [self function_init];
    
    [super viewDidLoad];
}


- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"开始摇动");
    return;
}

// 摇一摇取消摇动
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"取消摇动");
    return;
}

// 摇一摇摇动结束
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.subtype == UIEventSubtypeMotionShake) { // 判断是否是摇动结束
        NSLog(@"摇动结束");
        
        //震动
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
        //提示
        UIAlertView *sharkAlert = [[UIAlertView alloc] initWithTitle:@"地震了" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [sharkAlert show];
    }
    return;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
