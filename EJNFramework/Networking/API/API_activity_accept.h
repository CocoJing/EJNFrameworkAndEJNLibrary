//
//  API_activity_accept.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_activity_accept : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id activity_id;

/**
 用户ID：user_id
 活动ID：activity_id
 */
+(API_activity_accept *) create:(id)view_model user_id:(id)user_id activity_id:(id)activity_id;

@end
