//
//  API_provider_main.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商详情
@interface API_provider_detail : API_Base


@property (nonatomic,strong) id user_id;


/**
    user_id, int : 用户ID
 
 * @return
 */
+(API_provider_detail *) create:(id)view_model user_id:(id)user_id;

@end
