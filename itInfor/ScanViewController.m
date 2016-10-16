//
//  ScanViewController.m
//  itInfor
//
//  Created by 钱超 on 16/10/11.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "CommonDefines.h"
#import "ScanViewController.h"
@interface ScanViewController ()

@end

@implementation ScanViewController

- (void) function_init{
    //初始化手电筒状态为关闭
    _light_status = @"off";
    
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;

    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    self.title = @"扫一扫";
    
    
    
    //手电筒全屏的图片
    _lightImageView = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
    
    _lightImageView.image = [UIImage imageNamed:@"light_off@2x.jpg"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doTap:)];
    
    _lightImageView.userInteractionEnabled = YES;
    
    [_lightImageView addGestureRecognizer:tap];
    
    [self.view addSubview:_lightImageView];
}

- (void)viewDidLoad {
    //初始化界面
    [self function_init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void) doTap:(NSString *)str{
    device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    
    if([_light_status isEqualToString:@"off"]){
        _lightImageView.image = [UIImage imageNamed:@"light_on@2x.jpg"];
    
        _light_status = @"on";
        
        //打开手电筒
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
    }else{
        _lightImageView.image = [UIImage imageNamed:@"light_off@2x.jpg"];
        
        _light_status = @"off";

        //关闭手电筒
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

- (void) viewWillDisappear:(BOOL)animated{
    //关闭手电筒
    [device lockForConfiguration:nil];
    [device setTorchMode:AVCaptureTorchModeOff];
    [device unlockForConfiguration];
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
