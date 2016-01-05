//
//  API_relation_friendlst.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商详情
@interface API_relation_friendlst : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 (系统内)好友列表 relation.friendlst
 参数：
 user_id, int : 用户id - required
 page, int : 页码 - 默认为1
 pagesize, int : 提取条数 - 10
 返回：
 成功返回1
 失败返回原因
 */
+(API_relation_friendlst *) create:(id)view_model user_id:(id)user_id page:(id)page pagesize:(id)pagesize;

@end
