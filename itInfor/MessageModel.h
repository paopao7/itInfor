//
//  MessageModel.h
//  itInfor
//
//  Created by 钱超 on 16/8/3.
//  Copyright © 2016年 钱超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

//@property (nonatomic,strong) NSString *_image;
//
//@property (nonatomic,strong) NSString *_title;
//
//@property (nonatomic,strong) NSString *_content;
//
//@property (nonatomic,strong) NSString *_create_time;
//
//+ (instancetype)allocWithDic:(NSMutableDictionary *)dic;
//
//- (instancetype) initwithDic:(NSMutableDictionary *)dic;



@property (nonatomic,copy) NSString *image;

@property(nonatomic,copy) NSString *title;

@property(nonatomic,copy) NSString *content;

@property(nonatomic,copy) NSString *create_time;
/**
 *  通过字典来初始化模型对象
 *
 *  @param dic  字典对象
 *
 *  @return 已经初始化完毕的模型对象
 */
/*
 instancetype的作用，就是使那些非关联返回类型的方法返回所在类的类型！
 好处能够确定对象的类型，能够帮助编译器更好的为我们定位代码书写问题
 instanchetype和id的对比
 1、相同点
 都可以作为方法的返回类型
 
 2、不同点
 ①instancetype可以返回和方法所在类相同类型的对象，id只能返回未知类型的对象；
 
 ②instancetype只能作为返回值，不能像id那样作为参数，比如下面的写法：
 */
-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)appWithDict:(NSDictionary *)dict;


@end
