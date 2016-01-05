//
//  API_payment_braintreecancel.h
//  Enjoyney
//
//  Created by Andrew Liu on 8/22/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreecancel : API_Base

@property (nonatomic,strong) id userID;
@property (nonatomic,strong) id orderID;

+(API_payment_braintreecancel *) create:(id)view_model userID:(id)userID orderID:(id)orderID;

@end
