//
//  API_sp_apply.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/21/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_sp_applyflag : API_Base

@property (nonatomic,strong) id user_id;

///获取用户的服务商申请状态
+(API_sp_applyflag *) create:(id)view_model user_id:(id)user_id;

@end
