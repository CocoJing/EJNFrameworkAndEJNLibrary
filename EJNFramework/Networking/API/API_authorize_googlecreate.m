//
//  API_authorize_googlecreate.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/6/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_authorize_googlecreate.h"

@implementation API_authorize_googlecreate

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.googleID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.googleAccessToken]) {
        return true;
    }
    if(![API_Base is_object_valid:self.googleEmail]) {
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
    return @"authorize.googlecreate";
}

+(API_authorize_googlecreate *) create:(id)view_model googleID:(id)googleID token:(id)googleAccessToken email:(id)googleEmail password:(id)password firstName:(id)firstName lastName:(id)lastName {
    
    API_authorize_googlecreate *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.googleID            = googleID;
    model.googleAccessToken   = googleAccessToken;
    model.googleEmail         = googleEmail;
    model.password            = password;
    model.firstName           = firstName;
    model.lastName            = lastName;
    
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
    
    [self.param_table addObject:self.googleID?self.googleID:@""];
    [self.param_table addObject:self.googleAccessToken?self.googleAccessToken:@""];
    [self.param_table addObject:self.googleEmail?self.googleEmail:@""];
    [self.param_table addObject:self.password?self.password:@""];
    [self.param_table addObject:self.firstName?self.firstName:@""];
    [self.param_table addObject:self.lastName?self.lastName:@""];
    
    return true;
}

@end

