//
//  API_service_main.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_service_main : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id sp_user_id;

@property (nonatomic,strong) id longitude;
@property (nonatomic,strong) id latitude;
@property (nonatomic,strong) id radius;
@property (nonatomic,strong) id sex;
@property (nonatomic,strong) id date;
@property (nonatomic,strong) id interval;
@property (nonatomic,strong) id interest;

@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 用户ID：user_id
 SPID：sp_user_id
 经度：longitude
 纬度：latitude
 半径：radius
 日期：date
 时段：interval
 服务：interest
 页码：page
 提取条数：pagesize
 */
+(API_service_main *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id
                   longitude:(id)longitude latitude:(id)latitude    radius:(id)radius   sex:(id)sex
                        date:(id)date      interval:(id)interval  interest:(id)interest
                        page:(id)page      pagesize:(id)pagesize;

@end
