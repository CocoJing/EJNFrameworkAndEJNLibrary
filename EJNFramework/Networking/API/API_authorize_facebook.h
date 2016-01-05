//
//  API_authorize_facebook.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/3/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_facebook : API_Base

@property (nonatomic,strong) id facebookID;
@property (nonatomic,strong) id facebookEmail;
@property (nonatomic,strong) id facebookTokenString;

+(API_authorize_facebook *) create:(id)view_model facebookID:(id)facebookID email:(id)facebookEmail toekn:(id)facebookTokenString;

@end
