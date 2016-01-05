//
//  API_relation_platformunlinked.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#define RELATION_PLATFORMUNLINKED_PLATFORM_LOCAL    @"local"
#define RELATION_PLATFORMUNLINKED_PLATFORM_FACEBOOK	@"facebook"
#define RELATION_PLATFORMUNLINKED_PLATFORM_GOOGLE   @"google"

#import "API_Base.h"

@interface API_relation_platformunlinked : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id platform;
@property (nonatomic,strong) id emailkeys;

/**
 (系统外)第三方平台可加好友信息-针对add操作的list relation.platformunlinked
 参数：
 user_id, int : 用户id - required
 platform, string : 平台(local/facebook/google...) - required
 emailkeys, string : 邮箱(a,b,c) - 可为空
 返回：
 list(用户信息)
 */
+(API_relation_platformunlinked *) create:(id)view_model user_id:(id)user_id platform:(id)platform emailkeys:(id)emailkeys;

@end
