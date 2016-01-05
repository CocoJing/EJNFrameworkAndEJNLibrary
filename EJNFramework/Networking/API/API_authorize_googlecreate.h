//
//  API_authorize_googlecreate.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/6/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_authorize_googlecreate : API_Base

@property (nonatomic,strong) id googleID;
@property (nonatomic,strong) id googleAccessToken;
@property (nonatomic,strong) id googleEmail;
@property (nonatomic,strong) id password;
@property (nonatomic,strong) id firstName;
@property (nonatomic,strong) id lastName;

+(API_authorize_googlecreate *) create:(id)view_model googleID:(id)googleID token:(id)googleAccessToken email:(id)googleEmail password:(id)password firstName:(id)firstName lastName:(id)lastName;

@end
