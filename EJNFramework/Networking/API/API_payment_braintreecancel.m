//
//  API_payment_braintreecancel.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/22/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_payment_braintreecancel.h"

@implementation API_payment_braintreecancel
-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.userID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.orderID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"payment.braintreecancel";
}

+(API_payment_braintreecancel *) create:(id)view_model userID:(id)userID orderID:(id)orderID{
    
    API_payment_braintreecancel *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.userID        = userID;
    model.orderID       = orderID;
    
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
    [self.param_table addObject:self.orderID?self.orderID:@""];
    
    return true;
}

@end
