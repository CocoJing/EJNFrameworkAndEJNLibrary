//
//  GVUserDefaults+EJNUserPrefs.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/26.
//  assignright (c) 2015年 enjoyney. All rights reserved.
//

#import "GVUserDefaults+EJNUserPrefs.h"

@implementation GVUserDefaults (EJNUserPrefs)

@dynamic isLogined;

@dynamic im_id;
@dynamic user_id;
@dynamic base_nickname;         // string 用户昵称
@dynamic base_phone;            // string 电话
@dynamic base_email;            // string 邮箱
@dynamic base_business;         // int 供应商状态
@dynamic base_language;         // string 使用语言
@dynamic base_authorize;        // string,注册类型（示例：facebook,google），用逗号分割，如果邮箱注册为空
@dynamic service_categories;    // string 提供服务类型

@dynamic profile_sex;           // int 性别
@dynamic profile_firstname;     // string 姓
@dynamic profile_lastname;      // string 名
@dynamic profile_birthday;      // date 生日
@dynamic profile_education;     // string 教育
@dynamic profile_hometown;      // string 家乡
@dynamic photo_avatar;          // string 用户头像
@dynamic profile_address;       // string 地址
@dynamic profile_zipcode;       // string 邮编
@dynamic profile_interests;     // string 兴趣
@dynamic profile_work;          // string 工作
@dynamic profile_intro;         // string 个人介绍
@dynamic profile_short_intro;   // string 个人简介-一句话介绍
@dynamic photo_primary;         // string 个人详情背景图
@dynamic photo_background;      // string 列表背景图
@dynamic photo_intro;           // string - json 个人图片组

@dynamic vary_rank;                 // int 星级
@dynamic vary_relation_attention;   // int 关系-关注数
@dynamic vary_ralation_follow;      // int 关系-粉丝数
@dynamic vary_be_collected;         // int 被收藏数

@dynamic verify_phone_time;         // int 非0表示已经验证，且为验证的时间戳
@dynamic verify_email_time;         // int 非0表示已经验证，且为验证的时间戳
@dynamic status_request_time;       // int 注册时间
@dynamic status_approval_time;      // int 批准时间

@dynamic photo_service;                 // string 服务主题图片
@dynamic lbs_longitude;                 // double 经度
@dynamic lbs_latitude;                  // double 纬度
@dynamic fix_time_interval_afternoon;   // int 上午服务1/0
@dynamic fix_time_interval_morning;     // int 下午服务1/0
@dynamic fix_time_interval_night;       // int 晚上服务1/0
@dynamic fix_time_interval_anytime;     // int 任何时候1/0

@dynamic isfav;                         // 是否喜欢

@dynamic base_avg_star;              // base_avg_star => 0.00
@dynamic base_cnt_star;              // base_cnt_star => 0
@dynamic base_sp_avg_star;           // base_sp_avg_star => 0.00 for sp
@dynamic base_sp_cnt_star;           // base_sp_cnt_star => 0

@dynamic sp_apply_flag;              // sp_apply_flag => 0


//setup default value for key
- (NSDictionary *)setupDefaults {
    return @{
             @"isLogined"                   : @NO ,
             @"im_id"                       : @0  ,
             
             @"base_business"               : @0  ,     // int 供应商状态
             @"sp_apply_flag"               : @0 ,
             
             @"user_id"                     : @0  ,
             @"base_nickname"               : @"" ,     // string 用户昵称
             @"base_phone"                  : @"" ,     // string 电话
             @"base_email"                  : @"" ,     // string 邮箱
             @"base_language"               : @"" ,     // string 使用语言
             @"base_authorize"              : @"" ,     // string,注册类型（示例：facebook,google），用逗号分割，如果邮箱注册为空
             @"service_categories"          : @"" ,     // string 提供服务类型
             
             @"profile_sex"                 : @"" ,     // int 性别
             @"profile_firstname"           : @"" ,     // string 姓
             @"profile_lastname"            : @"" ,     // string 名
             @"profile_birthday"            : @"" ,     // date 生日
             @"profile_education"           : @"" ,     // string 教育
             @"profile_hometown"            : @"" ,     // string 家乡
             @"photo_avatar"                : @"" ,     // string 用户头像
             @"profile_address"             : @"" ,     // string 地址
             @"profile_zipcode"             : @"" ,     // string 邮编
             @"profile_interests"           : @"" ,     // string 兴趣
             @"profile_work"                : @"" ,     // string 工作
             @"profile_intro"               : @"" ,     // string 个人介绍
             @"profile_short_intro"         : @"" ,     // string 个人简介-一句话介绍
             @"photo_primary"               : @"" ,     // string 个人详情背景图
             @"photo_background"            : @"" ,     // string 列表背景图
             @"photo_intro"                 : @"" ,     // string - json 个人图片组
             
             @"vary_rank"                   : @"" ,     // int 星级
             @"vary_relation_attention"     : @"" ,     // int 关系-关注数
             @"vary_ralation_follow"        : @"" ,     // int 关系-粉丝数
             @"vary_be_collected"           : @"" ,     // int 被收藏数
             
             @"verify_phone_time"           : @"" ,     // int 非0表示已经验证，且为验证的时间戳
             @"verify_email_time"           : @"" ,     // int 非0表示已经验证，且为验证的时间戳
             @"status_request_time"         : @"" ,     // int 注册时间
             @"status_approval_time"        : @"" ,     // int 批准时间
             
             @"photo_service"               : @"" ,     // string 服务主题图片
             @"lbs_longitude"               : @"" ,     // double 经度
             @"lbs_latitude"                : @"" ,     // double 纬度
             @"fix_time_interval_afternoon" : @"" ,     // int 上午服务1/0
             @"fix_time_interval_morning"   : @"" ,     // int 下午服务1/0
             @"fix_time_interval_night"     : @"" ,     // int 晚上服务1/0
             @"fix_time_interval_anytime"   : @"" ,     // int 任何时候1/0
             
             @"isfav"                       : @NO ,     // 是否喜欢
             
             @"base_avg_star"               : @"" ,
             @"base_cnt_star"               : @"" ,
             @"base_sp_avg_star"            : @"" ,
             @"base_sp_cnt_star"            : @"" ,
             
             };
}

@end