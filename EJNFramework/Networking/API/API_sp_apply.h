//
//  API_sp_apply.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/21/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_sp_apply : API_Base

@property (nonatomic,strong) id userID;
@property (nonatomic,strong) id firstName;
@property (nonatomic,strong) id lastName;
@property (nonatomic,strong) id gender;
@property (nonatomic,strong) id birthday;
@property (nonatomic,strong) id phonNumber;
@property (nonatomic,strong) id location;
@property (nonatomic,strong) id services;
@property (nonatomic,strong) id aboutMe;

+(API_sp_apply *) create:(id)view_model userID:(id)userID firstName:(id)firstName lastName:(id)lastName gender:(id)gender
                           birthday:(id)birthday phonNumber:(id)phonNumber location:(id)location services:(id)services aboutMe:(id)aboutMe;

@end
