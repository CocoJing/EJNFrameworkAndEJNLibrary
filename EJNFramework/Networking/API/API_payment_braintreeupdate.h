//
//  API_payment_braintreeupdate.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/14/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreeupdate : API_Base

@property (nonatomic,strong) id token;

+(API_payment_braintreeupdate *) create:(id)view_model token:(id)token;

@end
