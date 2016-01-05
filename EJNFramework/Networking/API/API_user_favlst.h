//
//  API_user_favlst.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商详情
@interface API_user_favlst : API_Base


@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
    user_id, int : 用户ID
 
 * @return
 */
+(API_user_favlst *) create:(id)view_model user_id:(id)user_id page:(id)page pagesize:(id)pagesize;

@end
