//
//  API_activity_connections.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_activity_connections : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 用户ID：user_id
页码：page
提取条数：pagesize
 */
+(API_activity_connections *) create:(id)view_model
                        user_id:(id)user_id page:(id)page pagesize:(id)pagesize;

@end
