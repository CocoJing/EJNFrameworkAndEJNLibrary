//
//  EJNProvider.h
//  Enjoyney
//
//  Created by 傅强 on 15/8/1.
//  Copyright © 2015年 enjoyney. All rights reserved.
//


#import "ETY_User.h"

@interface ETY_Provider : ETY_User

@property (nonatomic,copy) NSString *photo_service;                 // string 服务主题图片
@property (nonatomic,copy) NSString *lbs_longitude;                 // double 经度
@property (nonatomic,copy) NSString *lbs_latitude;                  // double 纬度
@property (nonatomic,copy) NSString *fix_time_interval_afternoon;   // int 上午服务1/0
@property (nonatomic,copy) NSString *fix_time_interval_morning;     // int 下午服务1/0
@property (nonatomic,copy) NSString *fix_time_interval_night;       // int 晚上服务1/0
@property (nonatomic,copy) NSString *fix_time_interval_anytime;     // int 任何时候1/0

@property (nonatomic,copy) NSString *apply_flag;    //好友申请状态(1-新申请,5-已拒绝,9-已通过)

@property (nonatomic,assign) BOOL isfav;                            // 是否喜欢
@property (nonatomic,assign) NSInteger invite_status;                    //是否接受活动邀请

@end
