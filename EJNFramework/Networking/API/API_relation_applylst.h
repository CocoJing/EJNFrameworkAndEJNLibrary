//
//  API_relation_applylst.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_relation_applylst : API_Base

@property (nonatomic,strong) id user_id;

/**
 (系统内)好友申请记录 relation.applylst
 参数：
 user_id, int : 用户id - required
 返回：
 list
 */
+(API_relation_applylst *) create:(id)view_model user_id:(id)user_id;

@end
