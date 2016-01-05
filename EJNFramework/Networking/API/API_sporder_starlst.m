//
//  API_sporder_starlst.m
//  Enjoyney
//
//  Created by super on 15/10/18.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

#import "API_sporder_starlst.h"

@implementation API_sporder_starlst

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    if(![API_Base is_object_valid:self.sp_user_id]) {
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
    return @"sporder.starlst";
}


+(API_sporder_starlst *) create:(id)view_model sp_user_id:(id)sp_user_id user_id:(id)user_id order_id:(id)order_id
                    star_filter:(id)star_filter page:(id)page pagesize:(id)pagesize;
{
    API_sporder_starlst *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.sp_user_id    = sp_user_id;
    model.user_id       = user_id;
    model.order_id      = order_id;
    model.star_filter   = star_filter;
    model.page          = page;
    model.pagesize      = pagesize;
    
    
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
    [self.param_table addObject:self.sp_user_id?self.sp_user_id:@""];
    [self.param_table addObject:self.user_id?self.user_id:@""];
    [self.param_table addObject:self.order_id?self.order_id:@""];
    [self.param_table addObject:self.star_filter?self.star_filter:@""];
    [self.param_table addObject:self.page?self.page:@""];
    [self.param_table addObject:self.pagesize?self.pagesize:@""];
    return true;
}


@end
