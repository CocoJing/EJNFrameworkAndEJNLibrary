//
//  API_payment_braintreetoken.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/12/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_payment_braintreetoken.h"

@implementation API_payment_braintreetoken

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"payment.braintreetoken";
}

+(API_payment_braintreetoken *) create:(id)view_model userID:(id)userID {
    
    API_payment_braintreetoken *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.userID        = userID;
    
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
    
    return true;
}

@end
