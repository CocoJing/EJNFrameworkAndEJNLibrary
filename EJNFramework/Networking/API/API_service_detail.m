//
//  API_service_detail.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_service_detail.h"

@implementation API_service_detail

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.service_id]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"service.detail";
}

+(API_service_detail *) create:(id)view_model service_id:(id)service_id {

    API_service_detail *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.service_id = service_id;
    
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
    [self.param_table addObject:self.service_id?self.service_id:@""];
    
    return true;
}

@end
