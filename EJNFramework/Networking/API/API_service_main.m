//
//  API_service_main.m
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_service_main.h"

@implementation API_service_main


-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.interval]) {
        return true;
    }
    if(![API_Base is_object_valid:self.page]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"service.main";
}

+(API_service_main *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id
                   longitude:(id)longitude latitude:(id)latitude    radius:(id)radius   sex:(id)sex
                        date:(id)date      interval:(id)interval  interest:(id)interest
                        page:(id)page      pagesize:(id)pagesize {
    
    API_service_main *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id       = user_id;
    model.sp_user_id    = sp_user_id;
    
    model.longitude     = longitude;
    model.latitude      = latitude;
    model.radius        = radius;
    model.sex           = sex;
    model.date          = date;
    model.interval      = interval;
    model.interest      = interest;
    
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
    [self.param_table addObject:self.user_id?self.user_id:@""];
    [self.param_table addObject:self.sp_user_id?self.sp_user_id:@""];
    
    [self.param_table addObject:self.longitude?self.longitude:@""];
    [self.param_table addObject:self.latitude?self.latitude:@""];
    [self.param_table addObject:self.radius?self.radius:@""];
    [self.param_table addObject:self.sex?self.sex:@""];
    [self.param_table addObject:self.date?self.date:@""];
    [self.param_table addObject:self.interval?self.interval:@""];
    [self.param_table addObject:self.interest?self.interest:@""];
    
    [self.param_table addObject:self.page?self.page:@0];
    [self.param_table addObject:self.pagesize?self.pagesize:@10];
    
    return true;
}


@end
