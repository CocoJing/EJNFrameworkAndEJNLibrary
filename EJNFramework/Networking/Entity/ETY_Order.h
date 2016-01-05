//
//  ETY_Order.h
//  Enjoyney
//
//  Created by 傅强 on 15/9/3.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//
#import "ETY_Provider.h"

@interface ETY_Order : EJNNSObject

@property (nonatomic,copy) NSString *order_id;
@property (nonatomic,copy) NSString *order_time;

@property (nonatomic,copy) NSString *servcie_detail;
@property (nonatomic,copy) NSString *service_address;
@property (nonatomic,copy) NSString *service_interest;
@property (nonatomic,copy) NSString *service_date;
@property (nonatomic,copy) NSString *service_hour;
@property (nonatomic,copy) NSString *service_interval;
@property (nonatomic,copy) NSString *service_amount;
@property (nonatomic,copy) NSString *service_longitude;
@property (nonatomic,copy) NSString *service_latitude;

@property (nonatomic,copy) NSString *state_pay_flag;
@property (nonatomic,copy) NSString *state_pay_last;
@property (nonatomic,copy) NSString *state_order;

@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSNumber *user_im_id;
@property (nonatomic,copy) NSString *user_firstname;
@property (nonatomic,copy) NSString *user_lastname;
@property (nonatomic,copy) NSString *user_avatar;

@property (nonatomic,copy) NSString *sp_user_id;
@property (nonatomic,copy) NSNumber *sp_im_id;
@property (nonatomic,copy) NSString *sp_firstname;
@property (nonatomic,copy) NSString *sp_lastname;
@property (nonatomic,copy) NSString *sp_avatar;

@property (nonatomic,copy) NSString *star_user_flag; // 是否给订单用户评分
@property (nonatomic,copy) NSString *star_sp_flag;   // 是否给订单SP评分

// added by fuqiang at 2015-11-15
@property (nonatomic,copy) NSString *service_id;
@property (nonatomic,copy) NSString *service_title;
@property (nonatomic,copy) NSString *service_category;
@property (nonatomic,copy) NSString *service_flag;
@property (nonatomic,copy) NSString *service_cover;

@property (nonatomic,strong) ETY_Provider *sp_profile;
@property (nonatomic,strong) ETY_Provider *user_profile;

@property (nonatomic,copy) NSString *braintree_transaction_id;

@end
