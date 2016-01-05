//
//  API_payment_braintreedelete.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/15/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreedelete : API_Base

@property (nonatomic,strong) id token;

+(API_payment_braintreedelete *) create:(id)view_model token:(id)token;

@end
