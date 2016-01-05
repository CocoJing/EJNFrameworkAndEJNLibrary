//
//  API_sp_applystatus.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/21/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_sp_applystatus : API_Base

@property (nonatomic,strong) id user_id;

///更新用户申请服务提供商审核状态为待审核
+(API_sp_applystatus *) create:(id)view_model user_id:(id)user_id;

@end
