//
//  API_authorize_facebookcreate.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/3/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_authorize_facebookcreate.h"

@implementation API_authorize_facebookcreate

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.facebookID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.facebookTokenString]) {
        return true;
    }
    if(![API_Base is_object_valid:self.facebookEmail]) {
        return true;
    }
    if(![API_Base is_object_valid:self.password]) {
        return true;
    }
    if(![API_Base is_object_valid:self.firstName]) {
        return true;
    }
    if(![API_Base is_object_valid:self.lastName]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"authorize.facebookcreate";
}

+(API_authorize_facebookcreate *) create:(id)view_model facebookID:(id)facebookID token:(id)facebookTokenString email:(id)facebookEmail password:(id)password firstName:(id)firstName lastName:(id)lastName {
    
    API_authorize_facebookcreate *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.facebookID            = facebookID;
    model.facebookTokenString   = facebookTokenString;
    model.facebookEmail         = facebookEmail;
    model.password              = password;
    model.firstName             = firstName;
    model.lastName              = lastName;

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
    
    [self.param_table addObject:self.facebookID?self.facebookID:@""];
    [self.param_table addObject:self.facebookTokenString?self.facebookTokenString:@""];
    [self.param_table addObject:self.facebookEmail?self.facebookEmail:@""];
    [self.param_table addObject:self.password?self.password:@""];
    [self.param_table addObject:self.firstName?self.firstName:@""];
    [self.param_table addObject:self.lastName?self.lastName:@""];

    return true;
}

@end
