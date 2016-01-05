//
//  API_payment_braintreeupdate.m
//  Enjoyney
//
//  Created by Andrew Liu on 9/14/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_payment_braintreeupdate.h"

@implementation API_payment_braintreeupdate

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.token]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"payment.braintreeupdate";
}

+(API_payment_braintreeupdate *) create:(id)view_model token:(id)token {
    
    API_payment_braintreeupdate *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.token        = token;
    
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
    
    [self.param_table addObject:self.token?self.token:@""];
    
    return true;
}

@end
