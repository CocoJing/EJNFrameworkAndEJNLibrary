//
//  API_authorize_linkedin.m
//  Enjoyney
//
//  Created by Andrew Liu on 12/17/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_authorize_linkedin.h"

@implementation API_authorize_linkedin

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.linkedinID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.linkedinEmail]) {
        return true;
    }
    if(![API_Base is_object_valid:self.linkedinAccessToken]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"authorize.linkedin";
}

+(API_authorize_linkedin *) create:(id)view_model linkedinID:(id)linkedinID email:(id)linkedinEmail toekn:(id)linkedinAccessToken {
    
    API_authorize_linkedin *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.linkedinID            = linkedinID;
    model.linkedinEmail         = linkedinEmail;
    model.linkedinAccessToken   = linkedinAccessToken;
    
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
    [self.param_table addObject:self.linkedinEmail?self.linkedinEmail:@""];
    [self.param_table addObject:self.linkedinAccessToken?self.linkedinAccessToken:@""];
    
    return true;
}

@end
