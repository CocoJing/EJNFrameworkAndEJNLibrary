//
//  API_provider_aggregation.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_provider_aggregation.h"

@implementation API_provider_aggregation


-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.type]) {
        return true;
    }
    if(![API_Base is_object_valid:self.longitude]) {
        return true;
    }
    if(![API_Base is_object_valid:self.latitude]) {
        return true;
    }
    if(![API_Base is_object_valid:self.radius]) {
        return true;
    }
    if(![API_Base is_object_valid:self.date]) {
        return true;
    }
    if(![API_Base is_object_valid:self.time]) {
        return true;
    }
    if(![API_Base is_object_valid:self.interval]) {
        return true;
    }
    if(![API_Base is_object_valid:self.sex]) {
        return true;
    }
    if(![API_Base is_object_valid:self.user_id]) {
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
    return @"provider.aggregation";
}

+(API_provider_aggregation *) create:(id)view_model type:(id)type longitude:(id)longitude latitude:(id)latitude radius:(id)radius
                                date:(id)date time:(id)time interval:(id)interval sex:(id)sex interest:(id)interest
                             user_id:(id)user_id page:(id)page pagesize:(id)pagesize {
    
    API_provider_aggregation *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.type      = type;
    model.longitude = longitude;
    model.latitude  = latitude;
    model.radius    = radius;
    
    model.date      = date;
    model.time      = time;
    model.interval  = interval;
    model.sex       = sex;
    model.interest  = interest;
    model.user_id   = user_id;
    
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
    [self.param_table addObject:self.type?self.type:@""];
    [self.param_table addObject:self.longitude?self.longitude:@""];
    [self.param_table addObject:self.latitude?self.latitude:@""];
    [self.param_table addObject:self.radius?self.radius:@""];
    
    [self.param_table addObject:self.date?self.date:@""];
    [self.param_table addObject:self.time?self.time:@""];
    [self.param_table addObject:self.interval?self.interval:@""];
    [self.param_table addObject:self.sex?self.sex:@""];
    [self.param_table addObject:self.interest?self.interest:@""];
    [self.param_table addObject:self.user_id?self.user_id:@""];
    
    [self.param_table addObject:self.page?self.page:@0];
    [self.param_table addObject:self.pagesize?self.pagesize:@10];
    
    return true;
}

@end