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

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
}

//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setEditing:YES animated:YES];
    return UITableViewCellEditingStyleDelete;
}

//进入编辑模式，按下出现的编辑按钮后
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView setEditing:NO animated:YES];
}

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
    return 5;
}

//设置数据视图的组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (instancetype)initWithStyle:(UITableViewCellStyle) reuseIdentifier:(NSString *)reuseIdentifier{
    return UITableViewCellStyleDefault;
}

//创建单元格对象函数

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellStr = @"cell";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellStr];
    
    if(cell == nil){
        //创建一个单元格对象
        //P1:单元格的样式
        //P2:单元格的复用标记
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
  
    
    
//    NSString *str = [NSString stringWithFormat:@"第%ld组，第%ld行",indexPath.section,indexPath.row];
//    NSLog(@"%@",str);

    UIImageView *head_image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    
    head_image.image = [UIImage imageNamed:@"add_friend_icon_offical"];
    
    head_image.layer.cornerRadius = head_image.frame.size.width / 14;
    
    [cell.contentView addSubview:head_image];
    
    
    
    
    UILabel *title_label = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 220, 30)];
    
    title_label.text = @"订阅号";
    
    [title_label setTextColor:[UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00]];
    
    title_label.font = [UIFont fontWithName:@"Helvetica" size:16];
    
    [cell.contentView addSubview:title_label];
    
    
    
    UILabel *detail_label = [[UILabel alloc] initWithFrame:CGRectMake(60, 28, 300, 30)];
    
    detail_label.text = @"简笔笑话:芳芳，你这是得多想爱啊？";
    
    detail_label.font = [UIFont fontWithName:@"Helvetica" size:13];
    
    [detail_label setTextColor:[UIColor colorWithRed:0.61 green:0.61 blue:0.61 alpha:1.00]];
    
    [cell.contentView addSubview:detail_label];
    
    
    
    
    UILabel *time_label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-60, 0, 55, 30)];
    
    time_label.font = [UIFont fontWithName:@"Helvetica" size:11];
    
    [time_label setTextColor:[UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1.00]];
    
    time_label.text = @"下午 10:55";
    
    [cell.contentView addSubview:time_label];
    
    
    
    return cell;
}

//点击列表
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;{
    MessageDetailViewController *message_detail = [[MessageDetailViewController alloc] init];
    
    [self.navigationController pushViewController:message_detail animated:YES];
}

@end
