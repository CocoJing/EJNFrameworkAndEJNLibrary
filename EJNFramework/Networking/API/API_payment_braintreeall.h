//
//  API_payment_braintreeall.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/15/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreeall : API_Base

@property (nonatomic,strong) id userID;

+(API_payment_braintreeall *) create:(id)view_model userID:(id)userID;

@end
