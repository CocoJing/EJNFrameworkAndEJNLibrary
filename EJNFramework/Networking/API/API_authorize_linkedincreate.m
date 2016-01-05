//
//  API_authorize_linkedincreate.m
//  Enjoyney
//
//  Created by Andrew Liu on 12/17/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_authorize_linkedincreate.h"

@implementation API_authorize_linkedincreate

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.linkedinID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.linkedinAccessToken]) {
        return true;
    }
    if(![API_Base is_object_valid:self.linkedinEmail]) {
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
    return @"authorize.linkedincreate";
}

+(API_authorize_linkedincreate *) create:(id)view_model linkedinID:(id)linkedinID token:(id)linkedinAccessToken email:(id)linkedinEmail password:(id)password firstName:(id)firstName lastName:(id)lastName {
    
    API_authorize_linkedincreate *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.linkedinID            = linkedinID;
    model.linkedinAccessToken   = linkedinAccessToken;
    model.linkedinEmail         = linkedinEmail;
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
    
    [self.param_table addObject:self.linkedinID?self.linkedinID:@""];
    [self.param_table addObject:self.linkedinAccessToken?self.linkedinAccessToken:@""];
    [self.param_table addObject:self.linkedinEmail?self.linkedinEmail:@""];
    [self.param_table addObject:self.password?self.password:@""];
    [self.param_table addObject:self.firstName?self.firstName:@""];
    [self.param_table addObject:self.lastName?self.lastName:@""];
    
    return true;
}


@end
