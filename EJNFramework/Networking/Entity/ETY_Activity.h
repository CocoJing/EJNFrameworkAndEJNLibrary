//
//  ETY_Activity.h
//  Enjoyney
//
//  Created by super on 15/11/14.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

@interface ETY_Activity : EJNNSObject

@property (nonatomic,copy) NSString *activity_id;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *activity_title;
@property (nonatomic,copy) NSString *activity_datetime;
@property (nonatomic,copy) NSString *activity_address;
@property (nonatomic,copy) NSString *activity_lbs_longitude;
@property (nonatomic,copy) NSString *activity_lbs_latitude;
@property (nonatomic,copy) NSString *activity_cover;
@property (nonatomic,copy) NSString *activity_inviteds;
@property (nonatomic,copy) NSString *activity_visible;
@property (nonatomic,copy) NSString *activity_notes;
@property (nonatomic,copy) NSString *add_date;
@property (nonatomic,copy) NSString *add_time;
@property (nonatomic,copy) NSString *inviteds_count;

@property (nonatomic,strong) ETY_Provider   *user_profile;
@property (nonatomic,strong) NSMutableArray *activity_photos;
@property (nonatomic,strong) NSMutableArray *inviteds_info;

@property (nonatomic,assign) NSInteger invite_flag;     // 受邀列表用 受邀状态 9 接受 1 默认 0 拒绝
@property (nonatomic,assign) NSInteger invited_flag;    // 详情页面用 是否受邀 0 未受邀 1 已受邀

@property (nonatomic,assign) NSInteger invited_status;  // 详情页面用 是否接受（已接受 9，未处理 1，已拒绝 0）

@property (nonatomic,copy) NSString *activity_flag;

@end
