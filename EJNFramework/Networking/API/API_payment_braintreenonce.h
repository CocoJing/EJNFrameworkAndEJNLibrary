//
//  API_payment_braintreenonce.h
//  Enjoyney
//
//  Created by Andrew Liu on 9/1/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"
@interface API_payment_braintreenonce : API_Base

@property (nonatomic,strong) id nonce;
@property (nonatomic,strong) id amount;

+(API_payment_braintreenonce *) create:(id)view_model nonce:(id)nonce amount:(id)amount;


@end
