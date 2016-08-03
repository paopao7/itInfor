//
//  MessageModel.m
//  itInfor
//
//  Created by 钱超 on 16/8/3.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

//+(instancetype) allocWithDic:(NSMutableDictionary *)dic{
//    return [[self alloc] initwithDic:dic];
//}
//
//
//- (instancetype) initwithDic:(NSMutableDictionary *)dic{
//    if (self=[super init]) {
//        self.name=dicc[@"name"];
//        self.icon=dicc[@"icon"];
//    }
//    
//    return self;
//}
//
//- (void) dealloc{
//    //_title = nil;
//}



-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        self.image=dict[@"image"];
        self.title=dict[@"title"];
        self.content=dict[@"content"];
        self.title=dict[@"create_time"];
    }
    return self;
}
+(instancetype) appWithDict:(NSDictionary *)dict{
    
    // 为何使用self，谁调用self方法 self就会指向谁！！
    return [[self alloc] initWithDict:dict];
    
}


@end
