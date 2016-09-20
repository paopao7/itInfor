//
//  MessageViewController.m
//  itInfor
//
//  Created by 钱超 on 16/7/19.
//  Copyright © 2016年 钱超. All rights reserved.
//
#import "CommonDefines.h"
#import "MessageViewController.h"
#import "MessageDetailViewController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+NJ.h"
#import "MessageModel.h"

@implementation MessageViewController

- (void)getListDataFromServer
{
    _dataSource = [[NSMutableArray alloc]initWithCapacity:0];
    //        提交url相关
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    NSDictionary *parameters = nil;
    
    [manager POST:@"http://www.itinfor.cn/itInfor/index.php/Home/Index/get_message_list" parameters:parameters success:^(AFHTTPRequestOperation *operation, id data) {
        
        if(!data){
            [MBProgressHUD showError:@"网络繁忙，请稍后再试！"];
            
            return;
        }else{
            [MBProgressHUD showSuccess:@"恭喜,请求成功"];
            
            NSDictionary *respond = [data objectForKey:@"respond"];
            
            NSArray *list_arr = respond[@"list"];
            //NSArray *lists = data[@"respond"][@"list"];
            
            //                NSLog(@"title is %@",list_arr);
            for (NSDictionary *list_node in list_arr) {
                
                MessageModel *model = [MessageModel appWithDict:list_node];
                
                [_dataSource addObject:model];
            }
            
            //刷新表
            [_tableView reloadData];
            
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //网络请求
    [self internatRequest];
    //获取列表数据
    [self getListDataFromServer];
//    提交url相关
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
//    NSDictionary *parameters = @{};
    
    //    [manager POST:@"http://www.itinfor.cn/itInfor/index.php/Home/Index/get_message_list" parameters:parameters success:^(AFHTTPRequestOperation *operation, id data) {
    //
    //        if(!data){
    //            [MBProgressHUD showError:@"网络繁忙，请稍后再试！"];
    //
    //            return;
    //        }else{
    //            [MBProgressHUD showSuccess:@"恭喜,请求成功"];
    //        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //            NSLog(@"Error: %@", error);
    //        }];
//    
//    [manager POST:@"http://www.itinfor.cn/itInfor/index.php/Home/Index/get_message_list" parameters:nil success:^(AFHTTPRequestOperation *operation,id data){
//        
//        //        NSDictionary *dic = (NSDictionary *)data;
//        
//        
//        
//        NSArray *message_list = data[@"respond"][@"list"];
    
        //        NSLog(@"message = %@",message_list);
        
        /*for(NSMutableDictionary *message in message_list){
//            MessageModel  *MessageModels = [MessageModel appWithDict:message];
            MessageModel *messM = [[MessageModel alloc] init];
            
            NSLog(@"message title is %@",message[@"title"]);
            
            messM.title = message[@"title"];
            
//            [weakSelf.dataArr addObject:productModel];
            
            
//            MessageModel *MessageModel = [[MessageModel alloc] init];
            
//            MessageModel.title = message[@"title"];
//            MessageModel.image = message[@"image"];
        }*/
        
//        MessageModel *messM = [[MessageModel alloc] init];
        
//        messM = message_list;
        
//        MessageModel *messM = [[MessageModel alloc] init];
//        
//        NSLog(@"messM is %@",messM.title);
//        
//    }failure:^(AFHTTPRequestOperation *operation,NSError *error){
//        NSLog(@"Error: %@", error);
//    }];
    
    
    
    
    UISearchDisplayController *searchDisplayController;
    
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = Global_navigationbar_background_color;
    
    //设置返回按钮及文字的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //设置顶部文字颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:18]}];
    
    self.title = @"微信";
    
    _tableView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [_tableView setDelegate:self];
    
    [_tableView setDataSource:self];
    
    [self.view addSubview:_tableView];
    
    
    
    
    
    UIButton *add_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    add_btn.frame = CGRectMake(0, 0, 32, 32);
    
    [add_btn setBackgroundImage:[UIImage imageNamed:@"barbuttonicon_add"] forState:UIControlStateNormal];
    
    [add_btn addTarget:self action:@selector(add_btn_click) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right_bar_item = [[UIBarButtonItem alloc] initWithCustomView:add_btn];
    
    
    self.navigationItem.rightBarButtonItem = right_bar_item;
    
    
    
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
    _searchBar = searchBar;
    
    _searchBar.showsCancelButton = YES;
    
    searchBar.placeholder = @"搜索";
    
    _tableView.tableHeaderView = searchBar;
    
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
    // searchResultsDataSource 就是 UITableViewDataSource
    searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    searchDisplayController.searchResultsDelegate = self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIRefreshControl *rc = [[UIRefreshControl alloc] init];
    
    _rc = rc;
    
    rc.attributedTitle = [[NSAttributedString alloc] initWithString:@"下拉刷新"];
    
    [rc addTarget:self action:@selector(refreshTableView) forControlEvents:UIControlEventValueChanged];
    
//    self.refreshControl = rc;
    
    [_tableView addSubview:rc];
}

//网络请求
- (void) internatRequest{
    //提交url相关
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
//    [manager POST:@"http://www.itinfor.cn/itInfor/index.php/Home/Index/get_message_list" parameters:parameters success:^(AFHTTPRequestOperation *operation, id data) {
//        
//        if(!data){
//            [MBProgressHUD showError:@"网络繁忙，请稍后再试！"];
//            
//            return;
//        }else{
//            [MBProgressHUD showSuccess:@"恭喜,请求成功"];
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"Error: %@", error);
//        }];
    
    [manager POST:@"http://www.itinfor.cn/itInfor/index.php/Home/Index/get_message_list" parameters:nil success:^(AFHTTPRequestOperation *operation,id data){
        
//        NSDictionary *dic = (NSDictionary *)data;
        
        
        
        NSArray *message_list = data[@"respond"][@"list"];
        
//        NSLog(@"message = %@",message_list);
        
        for(NSMutableDictionary *message in message_list){
            MessageModel *messModel = [MessageModel appWithDict:message];
            
//            NSLog(@"message_list descrition %@",[message description]);
            
        }
        
        
    }failure:^(AFHTTPRequestOperation *operation,NSError *error){
        NSLog(@"Error: %@", error);
    }];
}

- (void) refreshTableView{
    // 结束刷新
    [_rc endRefreshing];
}

//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

////定义编辑样式
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView setEditing:YES animated:YES];
//    return UITableViewCellEditingStyleDelete;
//}

//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView setEditing:NO animated:YES];
    tableView.editing = YES;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
//    //其他代码
//}
//以下方法可以不是必须要实现，添加如下方法可实现特定效果：

//修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


- (void) add_btn_click{
    NSLog(@"点击了新增按钮");
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//获取每组元素额的个数(行数)
//必须要实现协议函数
//程序在显示数据视图时会调用此函数
//返回值:表示每组元素的格式
//P1:数据视图对象本身
//P2:哪一组需要的行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

//设置数据视图的组数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
//}

//- (instancetype)initWithStyle:(UITableViewCellStyle) reuseIdentifier:(NSString *)reuseIdentifier{
//    return UITableViewCellStyleDefault;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
    
    NSString *cellStr = @"cell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];

    //从数据源取出对应位置的model
    MessageModel    *model = _dataSource[indexPath.row];
    
    //cell重用
    if(cell == nil){
        //创建一个单元格对象
        //P1:单元格的样式
        //P2:单元格的复用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];

    /**
     *  创建UI控件
     */
        //头像
        UIImageView *head_image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        
        head_image.tag = 10;
        
        head_image.layer.cornerRadius = head_image.frame.size.width / 14;
        
        [cell.contentView addSubview:head_image];
    //标题

        UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 220, 30)];
    
        title_label.tag = 20;
        
        [title_label setTextColor:[UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00]];
    
        title_label.font = [UIFont fontWithName:@"Helvetica" size:16];
    
        [cell.contentView addSubview:title_label];

    //                //内容
        UILabel *detail_label = [[UILabel alloc] initWithFrame:CGRectMake(60, 28, 300, 30)];
    
        detail_label.tag = 30;
        
        detail_label.font = [UIFont fontWithName:@"Helvetica" size:13];
    
        [detail_label setTextColor:[UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1.00]];
    
        [cell.contentView addSubview:detail_label];
    
    
    
    //时间
        UILabel *time_label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-100, 0, 90, 30)];
    
        time_label.tag = 40;
        time_label.font = [UIFont fontWithName:@"Helvetica" size:11];
    
        [time_label setTextColor:[UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.00]];
    
        [cell.contentView addSubview:time_label];
    
    }
    
    //从重用的cell中找到控件
    UIImageView *headImage = (UIImageView   *)[cell.contentView viewWithTag:10];
    
    UILabel *titleLabel = (UILabel  *)[cell.contentView viewWithTag:20];
    
    UILabel *detailLabel = (UILabel *)[cell.contentView viewWithTag:30];
    
    UILabel *timeLabel = (UILabel   *)[cell.contentView viewWithTag:40];
    
    //给控件设值
    NSURL *url = [NSURL URLWithString:model.image];
    headImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
    titleLabel.text = model.title;
    
    NSString    *content1 = nil;
    NSString    *content2 = nil;
    //字符串截取
    content1 = [model.content substringToIndex:17];
    //字符串拼接
    content2 = [content1 stringByAppendingString:@"..."];
    detailLabel.text = content2;
    
    timeLabel.text = model.create_time;
    
    return cell;
}

//点击列表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
    MessageDetailViewController *message_detail = [[MessageDetailViewController alloc] init];
    
    [self.navigationController pushViewController:message_detail animated:YES];
}


#pragma mark <重写属性的set方法>
//创建单元格对象函数
/**
 *  这种写法是错误的 ： setModel,其中 Model 为属性的对象名，首字母大写。
 *  方法系统会自动生成
 */
- (void) setMessageModel:(MessageModel *)model{
    NSLog(@"ssssss");
    
}
/**
 *  重写属性 model 的 set 方法
 *
 *  @param model 要传入的 model 模型
 */
- (void) setModel:(MessageModel *)model
{
    NSLog(@"这才是真正的sssssssssssss");
}

@end
