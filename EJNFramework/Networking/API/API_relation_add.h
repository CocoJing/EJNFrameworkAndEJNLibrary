//
//  API_relation_add.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_relation_add : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id target_user_id;

/**
 (系统内)添加好友 relation.add
 参数:
 user_id,           int : 用户id - required
 target_user_id,    int : 目标用户 - required
 返回：
 成功返回1
 失败返回原因
 */
+(API_relation_add *) create:(id)view_model user_id:(id)user_id target_user_id:(id)target_user_id;

@end
