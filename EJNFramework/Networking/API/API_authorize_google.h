//
//  API_authorize_google.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/6/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_google : API_Base

@property (nonatomic,strong) id googleID;
@property (nonatomic,strong) id googleEmail;
@property (nonatomic,strong) id googleAccessToken;

+(API_authorize_google *) create:(id)view_model googleID:(id)googleID email:(id)googleEmail toekn:(id)googleAccessToken;

@end
