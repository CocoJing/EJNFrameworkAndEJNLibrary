//
//  API_authorize_google.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/6/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_authorize_google.h"

@implementation API_authorize_google

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.googleID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.googleEmail]) {
        return true;
    }
    if(![API_Base is_object_valid:self.googleAccessToken]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"authorize.google";
}

+(API_authorize_google *) create:(id)view_model googleID:(id)googleID email:(id)googleEmail toekn:(id)googleAccessToken {
    
    API_authorize_google *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.googleID            = googleID;
    model.googleEmail         = googleEmail;
    model.googleAccessToken   = googleAccessToken;
    
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
    [self.param_table addObject:self.googleEmail?self.googleEmail:@""];
    [self.param_table addObject:self.googleAccessToken?self.googleAccessToken:@""];
    
    return true;
}

@end
