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
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
    // Do any additional setup after loading the view.
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"扫一扫";
    
    
    //打开手电筒
    UIButton *_lightBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    _lightBtn.frame = CGRectMake(110, 120, 100, 30);
    
    
    [_lightBtn setTitle:@"turnON" forState:UIControlStateNormal];
    
    //    [lightBtn setTintColor:[UIColor blackColor]];
    
    _lightBtn.font = [UIFont fontWithName:@"Helvetica" size:20];
    
    [_lightBtn addTarget:self action:@selector(openLight) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_lightBtn];
}

- (void)viewDidLoad {
    [self function_init];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//打开手电筒
- (void) openLight{
    device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSString *status = _lightBtn.titleLabel.text;
    NSLog(@"status=========>%@",_lightBtn.currentTitle);
    if (![device hasTorch]) {//判断是否有闪光灯
//        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前设备没有闪光灯，不能提供手电筒功能" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
//        [alter show];
        
    }else if([status isEqualToString:@"turnON"]){
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        [device unlockForConfiguration];
        
        [_lightBtn setTitle:@"turnOFF" forState:UIControlStateNormal];
    }else{
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
         
        [_lightBtn setTitle:@"turnON" forState:UIControlStateNormal];
    }
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
