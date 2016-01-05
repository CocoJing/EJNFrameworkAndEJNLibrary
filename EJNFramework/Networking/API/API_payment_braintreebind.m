//
//  API_payment_braintreebind.m
//  Enjoyney
//
//  Created by Andrew Liu on 9/15/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_payment_braintreebind.h"

@implementation API_payment_braintreebind

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.userID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.nonce]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"payment.braintreebind";
}

+(API_payment_braintreebind *) create:(id)view_model userID:(id)userID nonce:(id)nonce {

    API_payment_braintreebind *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.userID        = userID;
    model.nonce         = nonce;

    if( ![model build] ) {
        return nil;
    }
    
    return model;
}

-(BOOL)build
{
    if( [self is_invalid] ) {
        return false;
    }
    
    self.param_table = [[NSMutableArray alloc] init];
    if( !self.param_table ) {
        return false;
    }
    
    [self.param_table addObject:self.userID?self.userID:@""];
    [self.param_table addObject:self.nonce?self.nonce:@""];

    return true;
}



@end
