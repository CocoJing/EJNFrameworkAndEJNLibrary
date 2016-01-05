//
//  API_payment_braintreebind.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/15/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreebind : API_Base

@property (nonatomic,strong) id nonce;
@property (nonatomic,strong) id userID;

+(API_payment_braintreebind *) create:(id)view_model userID:(id)userID nonce:(id)nonce;

@end
