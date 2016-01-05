//
//  API_relation_apply.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_relation_apply : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id target_user_id;

/**
 添加好友 relation.apply
 参数：
 user_id,           int : 用户id - required
 target_user_id,    int : 目标用户 - required
 返回：
 
 */
+(API_relation_apply *) create:(id)view_model user_id:(id)user_id target_user_id:(id)target_user_id;

@end
