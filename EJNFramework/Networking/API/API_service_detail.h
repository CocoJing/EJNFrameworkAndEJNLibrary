//
//  API_service_detail.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

// 服务提供商列表
@interface API_service_detail : API_Base


@property (nonatomic,strong) id service_id;


/**

 * @return
 */
+(API_service_detail *) create:(id)view_model service_id:(id)service_id;

@end
