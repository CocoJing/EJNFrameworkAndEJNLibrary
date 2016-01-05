//
//  ETY_Star_Comment.h
//  Enjoyney
//
//  Created by super on 15/10/18.
//  Copyright © 2015年 enjoyney. All rights reserved.
//


@interface ETY_Star_Comment : EJNNSObject

@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *order_id;
@property (nonatomic,copy) NSString *sp_star_val;
@property (nonatomic,copy) NSString *sp_star_msg;
@property (nonatomic,copy) NSString *sp_add_time;
@property (nonatomic,copy) NSString *user_photo_avatar;
@property (nonatomic,copy) NSString *user_profile_firstname;
@property (nonatomic,copy) NSString *user_profile_lastname;

@property (nonatomic,copy) NSString *user_star_val;
@property (nonatomic,copy) NSString *user_star_msg;
@property (nonatomic,copy) NSString *user_add_time;
@property (nonatomic,copy) NSString *sp_photo_avatar;
@property (nonatomic,copy) NSString *sp_profile_firstname;
@property (nonatomic,copy) NSString *sp_profile_lastname;
@end
