//
//  API_userorder_starlst.h
//  Enjoyney
//
//  Created by super on 15/10/18.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_userorder_starlst : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id sp_user_id;
@property (nonatomic,strong) id order_id;
@property (nonatomic,strong) id star_filter;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;


/**
 普通用户评分列表 ： userorder.starlst
 用户ID： user_id
 SP用户ID：sp_user_id
 订单ID： order_id
 过滤: star_filter
 页码：page
 提取条数：pagesize
 */
+(API_userorder_starlst *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id order_id:(id)order_id
                      star_filter:(id)star_filter page:(id)page pagesize:(id)pagesize;


@end
