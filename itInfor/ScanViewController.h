//
//  ScanViewController.h
//  itInfor
//
//  Created by 钱超 on 16/10/11.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ScanViewController : UIViewController{

NSString *_light_status;
UIButton *_lightBtn;
UIImageView *_lightImageView;
AVCaptureDevice *device;
    
}

@end
