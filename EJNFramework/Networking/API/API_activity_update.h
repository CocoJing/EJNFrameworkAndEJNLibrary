//
//  API_activity_update.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"


@interface API_activity_update : API_Base


@property (nonatomic,strong) id activity_id;
@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id title;
@property (nonatomic,strong) id desc;
@property (nonatomic,strong) id time;
@property (nonatomic,strong) id address;
@property (nonatomic,strong) id longitude;
@property (nonatomic,strong) id latitude;
@property (nonatomic,strong) id invited;
@property (nonatomic,strong) id visible;
@property (nonatomic,strong) id photos;

/**
 活动ID：      activity_id
 用户ID：user_id
 标题：title
 描述：desc
 时间：time
 地址：address
 邀请：invited
 公開：visible
 图片：photos
 */
+(API_activity_update *) create:(id)view_model activity_id:(id)activity_id
                        user_id:(id)user_id title:(id)title desc:(id)desc time:(id)time
                        address:(id)address longitude:(id)longitude latitude:(id)latitude
                        invited:(id)invited visible:(id)visible photos:(id)photos;

@end
