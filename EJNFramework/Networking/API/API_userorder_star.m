//
//  API_userorder_star.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_userorder_star.h"

@implementation API_userorder_star

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.sp_user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.order_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.star_val]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"userorder.star";
}

+(API_userorder_star *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id order_id:(id)order_id
                      star_val:(id)star_val star_msg:(id)star_msg {

    API_userorder_star *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id       = user_id;
    model.sp_user_id    = sp_user_id;
    model.order_id      = order_id;
    model.star_val      = star_val;
    model.star_msg      = star_msg;
    
    
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
    [self.param_table addObject:self.user_id?self.user_id:@""];
    [self.param_table addObject:self.sp_user_id?self.sp_user_id:@""];
    [self.param_table addObject:self.order_id?self.order_id:@""];
    [self.param_table addObject:self.star_val?self.star_val:@""];
    [self.param_table addObject:self.star_msg?self.star_msg:@""];
    
    return true;
}

@end
