//
//  GVUserDefaults+EJNUserPrefs.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/26.
//  weakright (c) 2015年 enjoyney. All rights reserved.
//

#import "GVUserDefaults.h"

@interface GVUserDefaults (EJNUserPrefs)

//-------------------------------------------------------------------
//    object 类型 使用 weak；
// 非 object 类型 使用 assign
//-------------------------------------------------------------------
@property (nonatomic,assign) BOOL     isLogined;

@property (nonatomic,weak) NSNumber *im_id;

@property (nonatomic,weak) NSNumber *base_business;         // int 供应商状态
@property (nonatomic,weak) NSNumber *sp_apply_flag;         // sp_apply_flag => 0


@property (nonatomic,weak) NSNumber *user_id;
@property (nonatomic,weak) NSString *base_nickname;         // string 用户昵称
@property (nonatomic,weak) NSString *base_phone;            // string 电话
@property (nonatomic,weak) NSString *base_email;            // string 邮箱
@property (nonatomic,weak) NSString *base_language;         // string 使用语言
@property (nonatomic,weak) NSString *base_authorize;        // string,注册类型（示例：facebook,google），用逗号分割，如果邮箱注册为空
@property (nonatomic,weak) NSString *service_categories;    // string 提供服务类型

@property (nonatomic,weak) NSString *profile_sex;           // int 性别
@property (nonatomic,weak) NSString *profile_firstname;     // string 姓
@property (nonatomic,weak) NSString *profile_lastname;      // string 名
@property (nonatomic,weak) NSString *profile_birthday;      // date 生日
@property (nonatomic,weak) NSString *profile_education;     // string 教育
@property (nonatomic,weak) NSString *profile_hometown;      // string 家乡
@property (nonatomic,weak) NSString *photo_avatar;          // string 用户头像
@property (nonatomic,weak) NSString *profile_address;       // string 地址
@property (nonatomic,weak) NSString *profile_zipcode;       // string 邮编
@property (nonatomic,weak) NSString *profile_interests;     // string 兴趣
@property (nonatomic,weak) NSString *profile_work;          // string 工作
@property (nonatomic,weak) NSString *profile_intro;         // string 个人介绍
@property (nonatomic,weak) NSString *profile_short_intro;   // string 个人简介-一句话介绍
@property (nonatomic,weak) NSString *photo_primary;         // string 个人详情背景图
@property (nonatomic,weak) NSString *photo_background;      // string 列表背景图

@property (nonatomic,weak) NSArray *photo_intro;            // string - json 个人图片组

@property (nonatomic,weak) NSString *vary_rank;                 // int 星级
@property (nonatomic,weak) NSString *vary_relation_attention;   // int 关系-关注数
@property (nonatomic,weak) NSString *vary_ralation_follow;      // int 关系-粉丝数
@property (nonatomic,weak) NSString *vary_be_collected;         // int 被收藏数

@property (nonatomic,weak) NSString *verify_phone_time;         // int 非0表示已经验证，且为验证的时间戳
@property (nonatomic,weak) NSString *verify_email_time;         // int 非0表示已经验证，且为验证的时间戳
@property (nonatomic,weak) NSString *status_request_time;       // int 注册时间
@property (nonatomic,weak) NSString *status_approval_time;      // int 批准时间


@property (nonatomic,weak) NSString *photo_service;                 // string 服务主题图片
@property (nonatomic,weak) NSString *lbs_longitude;                 // double 经度
@property (nonatomic,weak) NSString *lbs_latitude;                  // double 纬度
@property (nonatomic,weak) NSString *fix_time_interval_afternoon;   // int 上午服务1/0
@property (nonatomic,weak) NSString *fix_time_interval_morning;     // int 下午服务1/0
@property (nonatomic,weak) NSString *fix_time_interval_night;       // int 晚上服务1/0
@property (nonatomic,weak) NSString *fix_time_interval_anytime;     // int 任何时候1/0

@property (nonatomic,assign) BOOL isfav;                            // 是否喜欢

@property (nonatomic,weak) NSNumber *base_avg_star;              // base_avg_star => 0.00
@property (nonatomic,weak) NSNumber *base_cnt_star;              // base_cnt_star => 0
@property (nonatomic,weak) NSNumber *base_sp_avg_star;           // base_sp_avg_star => 0.00 for sp
@property (nonatomic,weak) NSNumber *base_sp_cnt_star;           // base_sp_cnt_star => 0


@end
