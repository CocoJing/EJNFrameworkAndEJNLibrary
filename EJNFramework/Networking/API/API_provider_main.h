//
//  API_provider_main.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商列表
@interface API_provider_main : API_Base


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
 经度：    longitude, float : 当前用户位置-经度 - required 116.442693
 纬度：    latitude,  float : 当前用户位置-纬度 - required 39.889974
 搜索半径： radius,    int : 搜索半径 - 默认5km
 日期：2015-07-30
 时间：1438236406
 选择时段：0  取值范围：1-上午，2-下午，3-晚上，4-任意时段，可复选，复选格式为：1,2 或  2,3 或 1,2,3 如果有 4则忽略其他时段选择
 选择性别：0  0-不限，1-男，2-女 单选
 选择兴趣：[music,football]
 登录用户：0
 最小值：    page,     int : 页码 - 默认0
 提取条数：  pagesize,  int : 每页取数据数量 - 默认10
 
 * @return
 */
+(API_provider_main *) create:(id)view_model longitude:(id)longitude latitude:(id)latitude radius:(id)radius
                         date:(id)date time:(id)time interval:(id)interval sex:(id)sex interest:(id)interest
                      user_id:(id)user_id page:(id)page pagesize:(id)pagesize;

@end
