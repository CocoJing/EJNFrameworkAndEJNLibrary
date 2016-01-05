//
//  API_activity_inviteds.m
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_activity_inviteds.h"

@implementation API_activity_inviteds


-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.activity_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.page]) {
        return true;
    }
    if(![API_Base is_object_valid:self.pagesize]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"activity.inviteds";
}

+(API_activity_inviteds *) create:(id)view_model activity_id:(id)activity_id page:(id)page pagesize:(id)pagesize {
    
    API_activity_inviteds *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.activity_id   = activity_id;
    model.page      = page;
    model.pagesize  = pagesize;
    
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
    
    // 手写
    [self.param_table addObject:self.activity_id?self.activity_id:@""];
    [self.param_table addObject:self.page?self.page:@0];
    [self.param_table addObject:self.pagesize?self.pagesize:@10];
    
    return true;
}



@end
