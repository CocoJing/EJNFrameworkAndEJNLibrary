//
//  API_payment_braintreefind.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/11/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_payment_braintreefind : API_Base

@property (nonatomic,strong) id userID;

+(API_payment_braintreefind *) create:(id)view_model userID:(id)userID;

@end