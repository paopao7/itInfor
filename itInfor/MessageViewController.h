//
//  MessageViewController.h
//  itInfor
//
//  Created by 钱超 on 16/7/19.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface MessageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    //定义一个数据视图对象
    //数据视图用来显示大量相同格式的大量信息的视图
    //例如 通讯录 QQ好友 朋友圈

    
    UITableView *_tableView;
    
    UISearchBar *_searchBar;
    
    UIRefreshControl *_rc;
    
    
    

}

@property (nonatomic,copy)UILabel *title_label;

@property (strong,nonatomic)MessageModel  *model;

@property (nonatomic, strong) NSMutableArray *dataSource;//数据源

//- (void) setModel:(MessageModel *)model;


@end
