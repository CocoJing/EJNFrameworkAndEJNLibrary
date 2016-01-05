//
//  API_payment_braintreesubmit.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/19/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreesubmit : API_Base

@property (nonatomic,strong) id userID;
@property (nonatomic,strong) id orderID;

+(API_payment_braintreesubmit *) create:(id)view_model userID:(id)userID orderID:(id)orderID;

@end
