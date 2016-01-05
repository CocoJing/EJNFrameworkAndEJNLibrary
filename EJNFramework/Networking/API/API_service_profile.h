//
//  API_service_profile.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_service_profile : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id target_user_id;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 用户ID：user_id
 页码：page
 提取条数：pagesize
 */
+(API_service_profile *) create:(id)view_model user_id:(id)user_id target_user_id:(id)target_user_id page:(id)page pagesize:(id)pagesize;

@end
