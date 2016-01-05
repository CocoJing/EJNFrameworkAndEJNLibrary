//
//  API_provider_main.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_user_findimidsuser.h"

@implementation API_user_findimidsuser

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }

    if(![API_Base is_object_valid:self.imids]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"user.findimidsuser";
}

+(API_user_findimidsuser *) create:(id)view_model imids:(id)imids {

    API_user_findimidsuser *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.imids     = imids;
    
    
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
    [self.param_table addObject:self.imids?self.imids:@""];
    
    return true;
}

@end
