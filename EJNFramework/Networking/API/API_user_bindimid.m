//
//  API_provider_main.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_user_bindimid.h"

@implementation API_user_bindimid

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }

    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.im_id]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"user.bindimid";
}

+(API_user_bindimid *) create:(id)view_model user_id:(id)user_id im_id:(id)im_id {

    API_user_bindimid *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id   = user_id;
    model.im_id     = im_id;
    
    
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
    [self.param_table addObject:self.im_id?self.im_id:@""];
    
    return true;
}

@end
