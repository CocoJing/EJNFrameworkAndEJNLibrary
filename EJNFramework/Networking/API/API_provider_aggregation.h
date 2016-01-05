//
//  API_provider_aggregation.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_provider_aggregation : API_Base


@property (nonatomic,strong) id type;

@property (nonatomic,strong) id longitude;
@property (nonatomic,strong) id latitude;
@property (nonatomic,strong) id radius;

@property (nonatomic,strong) id date;
@property (nonatomic,strong) id time;
@property (nonatomic,strong) id interval;
@property (nonatomic,strong) id sex;
@property (nonatomic,strong) id interest;
@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 type, string : 类型 - 示例：professional/explore - required
 */
+(API_provider_aggregation *) create:(id)view_model type:(id)type longitude:(id)longitude latitude:(id)latitude radius:(id)radius
                                date:(id)date time:(id)time interval:(id)interval sex:(id)sex interest:(id)interest
                             user_id:(id)user_id page:(id)page pagesize:(id)pagesize;

@end
