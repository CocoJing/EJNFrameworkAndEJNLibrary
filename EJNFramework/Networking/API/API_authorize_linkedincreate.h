//
//  API_authorize_linkedincreate.h
//  Enjoyney
//
//  Created by Andrew Liu on 12/17/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_linkedincreate : API_Base

@property (nonatomic,strong) id linkedinID;
@property (nonatomic,strong) id linkedinAccessToken;
@property (nonatomic,strong) id linkedinEmail;
@property (nonatomic,strong) id password;
@property (nonatomic,strong) id firstName;
@property (nonatomic,strong) id lastName;

+(API_authorize_linkedincreate *) create:(id)view_model linkedinID:(id)linkedinID token:(id)linkedinAccessToken email:(id)linkedinEmail password:(id)password firstName:(id)firstName lastName:(id)lastName;

@end
