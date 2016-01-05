//
//  API_authorize_facebook.m
//  Enjoyney
//
//  Created by Andrew Liu on 8/3/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_authorize_facebook.h"

@implementation API_authorize_facebook

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.facebookID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.facebookEmail]) {
        return true;
    }
    if(![API_Base is_object_valid:self.facebookTokenString]) {
        return true;
    }
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"authorize.facebook";
}

+(API_authorize_facebook *) create:(id)view_model facebookID:(id)facebookID email:(id)facebookEmail toekn:(id)facebookTokenString {
    
    API_authorize_facebook *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    model.facebookID            = facebookID;
    model.facebookEmail         = facebookEmail;
    model.facebookTokenString   = facebookTokenString;
    
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
    [self.param_table addObject:self.facebookEmail?self.facebookEmail:@""];
    [self.param_table addObject:self.facebookTokenString?self.facebookTokenString:@""];
    
    return true;
}

@end
