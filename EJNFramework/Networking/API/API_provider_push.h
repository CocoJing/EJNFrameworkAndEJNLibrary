//
//  API_provider_main.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商详情
@interface API_provider_push : API_Base


/**
 type, string : 类型 - 示例：connections/featuredlocal - required
 */
+(API_provider_push *) create:(id)view_model;

@end
