//
//  API_service_online.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商列表
@interface API_service_online : API_Base


@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id service_id;


/**
 用户ID：user_id
服务ID：service_id
 * @return
 */
+(API_service_online *) create:(id)view_model user_id:(id)user_id service_id:(id)service_id;

@end
