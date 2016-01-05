//
//  API_authorize_facebookcreate.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/3/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_facebookcreate : API_Base

@property (nonatomic,strong) id facebookID;
@property (nonatomic,strong) id facebookTokenString;
@property (nonatomic,strong) id facebookEmail;
@property (nonatomic,strong) id password;
@property (nonatomic,strong) id firstName;
@property (nonatomic,strong) id lastName;

+(API_authorize_facebookcreate *) create:(id)view_model facebookID:(id)facebookID token:(id)facebookTokenString email:(id)facebookEmail password:(id)password firstName:(id)firstName lastName:(id)lastName;

@end
