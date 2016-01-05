//
//  API_authorize_linkedin.h
//  Enjoyney
//
//  Created by Andrew Liu on 12/17/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_linkedin : API_Base

@property (nonatomic,strong) id linkedinID;
@property (nonatomic,strong) id linkedinEmail;
@property (nonatomic,strong) id linkedinAccessToken;

+(API_authorize_linkedin *) create:(id)view_model linkedinID:(id)linkedinID email:(id)linkedinEmail toekn:(id)linkedinAccessToken;

@end
