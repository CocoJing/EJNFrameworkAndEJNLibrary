

#import "API_Base.h"

////用户信息补充
@interface API_user_updateprofile : API_Base

/*
 user_id,       int : 用户ID - required
 firstname,     string : firstname - required
 lastname,      string : lastname - required
 gender,        string : 性别(1-男,2-女) - required
 birthdate,     string : 生日(2015-09-28) - required
 phone,         string : 电话 - required
 location,      string : 地址 - required
 activities,    string : 兴趣(hour,coffee) - required
 about,         string : 简介 - required
 
 item - 用户信息
 */

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id firstname;
@property (nonatomic,strong) id lastname;
@property (nonatomic,strong) id gender;
@property (nonatomic,strong) id birthdate;
@property (nonatomic,strong) id phone;
@property (nonatomic,strong) id location;
@property (nonatomic,strong) id activities;
@property (nonatomic,strong) id about;

/**
 * //用户
 
 * @return
 */
+(API_user_updateprofile *) create:(id)view_model
                           user_id:(id)user_id      firstname:(id)firstname lastname:(id)lastname gender:(id)gender
                           birthdate:(id)birthdate  phone:(id)phone         location:(id)location activities:(id)activities
                           about:(id)about;

@end


