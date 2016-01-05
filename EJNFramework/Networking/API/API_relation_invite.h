//
//  API_relation_invite.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#define RELATION_INVITE_PLATFORM_LOCAL     	@"local"
#define RELATION_INVITE_PLATFORM_FACEBOOK	@"facebook"
#define RELATION_INVITE_PLATFORM_GOOGLE     @"google"

#import "API_Base.h"

// 服务提供商详情
@interface API_relation_invite : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id target_email;
@property (nonatomic,strong) id platform;

/**
(系统外)邀请好友 relation.invite
 参数：
 user_id, int : 用户id - required
 target_email, string : 目标邮箱 - required
 platform, string : 平台(local/facebook/google...) - required
 返回：
 成功返回1
 失败返回原因
 */
+(API_relation_invite *) create:(id)view_model user_id:(id)user_id target_email:(id)target_email platform:(id)platform;

@end
