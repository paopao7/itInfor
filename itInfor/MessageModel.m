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
        NSLog(@"数据 = %@",dict);
        self.image=dict[@"image"];
        self.title=dict[@"title"];
        self.content=dict[@"content"];
        self.create_time=dict[@"create_time"];
    }
    return self;
}
<<<<<<< HEAD
+(instancetype)appWithDict:(NSDictionary *)dict{
=======
/**
 *  这是一个类方法（静态方法，加号方法），返回本类的实例化对象
 *
 *  @param dict 传入的字典（原始数据）
 *
 *  @return 本类实例化的对象
 */
+(instancetype) appWithDict:(NSDictionary *)dict{
>>>>>>> origin/master
    
    // 为何使用self，谁调用self方法 self就会指向谁！！
    
    /*
     *  为什么要使用self
     *  
     *  因为类方法里，self就表示类名，不表示该类的对象。
     *  [类名 类方法] [对象 对象方法] 是OC调用方法的两种规则。类方法就是“+”开头的方法；对象方法就是“-”开头的方法
     *  alloc           是一个 类方法，故需要 类名 来调用
     *  initWithDict:   是一个 对象方法， 故需要 对象来调用。initWithDict:是对alloc开辟的存储空间进行实例化
     */
    return [[self alloc] initWithDict:dict];
    
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"image = %@\ntitle = %@\n content = %@\n create_time = %@",self.image,self.title,self.content,self.create_time];
}

@end
