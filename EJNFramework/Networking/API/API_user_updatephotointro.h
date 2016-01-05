//
//  API_user_unfav.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#define UPDATE_PHOTO_ACTION_ADD     @"add"
#define UPDATE_PHOTO_ACTION_DEL     @"del"
#define UPDATE_PHOTO_ACTION_COVER   @"cover"

#import "API_Base.h"

// 服务提供商详情
@interface API_user_updatephotointro : API_Base

/*
 action,    string : 执行动作(add/del/cover) - required
 user_id,   int : 当前登录用户ID - required
 path,      string : 图片路径(限del/cover使用) - required
 
 add：返回当前用户的图片组-数组
 del/cover：返回1-成功/0-失败
 */

@property (nonatomic,strong) id action;
@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id path;

/**
 action,    string : 执行动作(add/del/cover) - required
 
 #define UPDATE_PHOTO_ACTION_ADD     @"add"
 #define UPDATE_PHOTO_ACTION_DEL     @"del"
 #define UPDATE_PHOTO_ACTION_COVER   @"cover"
 
 user_id,   int : 当前登录用户ID - required
 path,      string : 图片路径(限del/cover使用) - required
 
 add：返回当前用户的图片组-数组
 del/cover：返回1-成功/0-失败
 */
+(API_user_updatephotointro *) create:(id)view_model action:(id)action user_id:(id)user_id path:(id)path;

@end
