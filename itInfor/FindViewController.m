//
//  FindViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/19.
//  Copyright © 2016年 钱超. All rights reserved.
//
#import "CommonDefines.h"
#import "FindViewController.h"
#import "ScanViewController.h"
#import "SharkViewController.h"

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    self.title = @"发现";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else{
        return 2;
    }
}

//设置数据视图的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    NSString *cellStr = @"cell";
    
    if(cell == nil){
        //创建一个单元格对象
        //P1:单元格的样式
        //P2:单元格的复用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.section == 0 && indexPath.row == 0){
        cell.textLabel.text = @"朋友圈";
        
        cell.imageView.image = [UIImage imageNamed:@"ff_IconShowAlbum"];
        
    }else if(indexPath.section == 1 && indexPath.row == 0){
        cell.textLabel.text = @"扫一扫";
        
        cell.imageView.image = [UIImage imageNamed:@"ff_IconQRCode"];
        
    }else if(indexPath.section == 1 && indexPath.row == 1){
        cell.textLabel.text = @"摇一摇";
        
        cell.imageView.image = [UIImage imageNamed:@"ff_IconShake"];
        
    } if(indexPath.section == 2 && indexPath.row == 0){
        cell.textLabel.text = @"附近的人";
        
        cell.imageView.image = [UIImage imageNamed:@"ff_IconLocationService"];
        
    } if(indexPath.section == 2 && indexPath.row == 1){
        cell.textLabel.text = @"漂流瓶";
        
        cell.imageView.image = [UIImage imageNamed:@"ff_IconBottle"];
        
    } if(indexPath.section == 3 && indexPath.row == 0){
        cell.textLabel.text = @"购物";
        
        cell.imageView.image = [UIImage imageNamed:@"CreditCard_ShoppingBag"];
        
    } if(indexPath.section == 3 && indexPath.row == 1){
        cell.textLabel.text = @"游戏";
        
        cell.imageView.image = [UIImage imageNamed:@"MoreGame"];
    }
    
    return cell;
}


//点击列表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //扫一扫
    if(indexPath.section == 1 && indexPath.row == 0){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
        
         ScanViewController *scan_detail = [[ScanViewController alloc] init];
        
        [self.navigationController pushViewController:scan_detail animated:YES];
    //摇一摇
    }else if(indexPath.section == 1 && indexPath.row == 1){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
        SharkViewController *shark_detail = [[SharkViewController alloc] init];
    
        [self.navigationController pushViewController:shark_detail animated:YES];
    }
}
@end
