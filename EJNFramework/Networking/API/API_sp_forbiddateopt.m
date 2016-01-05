//
//  API_sp_forbiddateopt.m
//  Enjoyney
//
//  Created by Andrew Liu on 10/8/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_sp_forbiddateopt.h"

@implementation API_sp_forbiddateopt

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    if(![API_Base is_object_valid:self.userID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.opt]) {
        return true;
    }
    if(![API_Base is_object_valid:self.date]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"sp.forbiddateopt";
}

+(API_sp_forbiddateopt *) create:(id)view_model userID:(id)userID opt:(id)opt date:(id)date {
    
    API_sp_forbiddateopt *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    model.userID        = userID;
    model.opt           = opt;
    model.date          = date;
    
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
    [self.param_table addObject:self.opt?self.opt:@""];
    [self.param_table addObject:self.date?self.date:@""];

    
    return true;
}

@end
