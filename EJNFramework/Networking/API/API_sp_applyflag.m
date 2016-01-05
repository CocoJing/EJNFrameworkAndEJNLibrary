//
//  API_sp_apply.m
//  Enjoyney
//
//  Created by Andrew Liu on 9/21/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_sp_applyflag.h"

@implementation API_sp_applyflag

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
 
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    
    return false;
}


+(NSString*) CMD {
    return @"sp.applyflag";
}


+(API_sp_applyflag *) create:(id)view_model user_id:(id)user_id {
    
    API_sp_applyflag *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.user_id       = user_id;
    
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
    
    [self.param_table addObject:self.user_id?self.user_id:@""];

    return true;
}

@end
