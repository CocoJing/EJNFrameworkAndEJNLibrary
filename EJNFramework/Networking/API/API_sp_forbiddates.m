//
//  API_sp_forbiddates.m
//  Enjoyney
//
//  Created by Andrew Liu on 10/8/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_sp_forbiddates.h"

@implementation API_sp_forbiddates

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    if(![API_Base is_object_valid:self.userID]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"sp.forbiddates";
}

+(API_sp_forbiddates *) create:(id)view_model userID:(id)userID {
    
    API_sp_forbiddates *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    model.userID        = userID;
    
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
    
    return true;
}

@end
