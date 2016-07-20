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
    
    UISearchDisplayController *searchDisplayController;
    
    //更改navigationBar前景色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.00];
    
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
//
    _searchBar = searchBar;
    
    _searchBar.showsCancelButton = YES;
    
    searchBar.placeholder = @"搜索";
//
    _tableView.tableHeaderView = searchBar;
    
    searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    
    // searchResultsDataSource 就是 UITableViewDataSource
    searchDisplayController.searchResultsDataSource = self;
    // searchResultsDelegate 就是 UITableViewDelegate
    searchDisplayController.searchResultsDelegate = self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar

{
    
    searchBar.showsCancelButton = YES;       //显示“取消”按钮
    
    for(id cc in [searchBar subviews])
        
    {
        
        for (UIView *view in [cc subviews]) {
            
            if ([NSStringFromClass(view.class)                 isEqualToString:@"UINavigationButton"])
                
            {
                
                
                
                UIButton *btn = (UIButton *)view;
                
                [btn setTitle:@"取消" forState:UIControlStateNormal];
                
                
                
            }
            
            
            
        }
        
        
        
    }
    
    
    
}



//当点击取消按钮时，响应以下函数，实现功能：
//
//1）隐藏取消按钮；
//
//2）取消输入。

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar

{
    
    //[self cancelSearch];
    
    searchBar.showsCancelButton = NO;
    
    [searchBar resignFirstResponder];
    
}


//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    NSLog(@"点击了cancel");
//    [_searchBar resignFirstResponder];_searchBar.showsCancelButton = NO;
//    
//    [_searchBar resignFirstResponder];
//}

//点击空白处关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void) add_btn_click{
    NSLog(@"点击了新增按钮");
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
    return 3;
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
    
    NSString *str = [NSString stringWithFormat:@"第%ld组，第%ld行",indexPath.section,indexPath.row];
    
    //将单元格的主文字内服赋值
    cell.textLabel.text = str;
    
    return cell;
}
@end
