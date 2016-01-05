//
//  API_payment_braintreenonce.m
//  Enjoyney
//
//  Created by Andrew Liu on 9/1/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_payment_braintreenonce.h"

@implementation API_payment_braintreenonce


-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.nonce]) {
        return true;
    }
    if(![API_Base is_object_valid:self.amount]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"payment.braintreenonce";
}

+(API_payment_braintreenonce *) create:(id)view_model nonce:(id)nonce amount:(id)amount{
    
    API_payment_braintreenonce *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.nonce        = nonce;
    model.amount       = amount;
    
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
    
    [self.param_table addObject:self.nonce?self.nonce:@""];
    [self.param_table addObject:self.amount?self.amount:@""];
    
    return true;
}

@end
