//
//  API_userorder_star.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_userorder_star : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id sp_user_id;
@property (nonatomic,strong) id order_id;
@property (nonatomic,strong) id star_val;
@property (nonatomic,strong) id star_msg;

/**
 对SP评分 userorder.star
 用户ID： user_id
 SP用户ID：sp_user_id
 订单ID： order_id
 评分： star_val
 消息：star_msg
 */
+(API_userorder_star *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id order_id:(id)order_id
                                              star_val:(id)star_val star_msg:(id)star_msg;

@end
