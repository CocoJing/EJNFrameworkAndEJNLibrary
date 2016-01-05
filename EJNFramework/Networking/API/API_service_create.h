//
//  API_service_create.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"


@interface API_service_create : API_Base


@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id category;
@property (nonatomic,strong) id title;
@property (nonatomic,strong) id address;
@property (nonatomic,strong) id longitude;
@property (nonatomic,strong) id latitude;
@property (nonatomic,strong) id period;
@property (nonatomic,strong) id interval;
@property (nonatomic,strong) id price;
@property (nonatomic,strong) id pricedetail;
@property (nonatomic,strong) id desc;
@property (nonatomic,strong) id photoes;

/**
 用户ID：    user_id
 类型：      category
 标题：      title
 地址：      address
 时长(min)： period
 时段：      interval
 价格：      price
 价格说明：   pricedetail
 描述：      desc
 图片组：    photoes
 */
+(API_service_create *) create:(id)view_model
                       user_id:(id)user_id category:(id)category title:(id)title
                      address:(id)address longitude:(id)longitude latitude:(id)latitude
                        period:(id)period interval:(id)interval
                      price:(id)price pricedetail:(id)pricedetail
                      desc:(id)desc photoes:(id)photoes;

@end
