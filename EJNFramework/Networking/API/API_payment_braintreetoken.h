//
//  API_payment_braintreetoken.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/12/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreetoken : API_Base

@property (nonatomic,strong) id userID;

+(API_payment_braintreetoken *) create:(id)view_model userID:(id)userID;

@end
