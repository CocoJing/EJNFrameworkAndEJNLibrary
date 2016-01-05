//
//  API_activity_create.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_activity_create.h"

@implementation API_activity_create

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.title]) {
        return true;
    }
    if(![API_Base is_object_valid:self.time]) {
        return true;
    }
    if(![API_Base is_object_valid:self.address]) {
        return true;
    }
    if(![API_Base is_object_valid:self.longitude]) {
        return true;
    }
    if(![API_Base is_object_valid:self.latitude]) {
        return true;
    }
    if(![API_Base is_object_valid:self.visible]) {
        return true;
    }
    if(![API_Base is_object_valid:self.photos]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"activity.create";
}

+(API_activity_create *) create:(id)view_model
                        user_id:(id)user_id title:(id)title desc:(id)desc time:(id)time
                        address:(id)address longitude:(id)longitude latitude:(id)latitude
                        invited:(id)invited visible:(id)visible photos:(id)photos {

    API_activity_create *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id   = user_id;
    model.title     = title;
    model.desc      = desc;
    model.time      = time;
    model.address   = address;
    model.longitude = longitude;
    model.latitude  = latitude;
    model.invited   = invited;
    model.visible   = visible;
    model.photos    = photos;
    
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
    [self.param_table addObject:self.title?self.title:@""];
    [self.param_table addObject:self.desc?self.desc:@""];
    [self.param_table addObject:self.time?self.time:@""];
    [self.param_table addObject:self.address?self.address:@""];
    [self.param_table addObject:self.longitude?self.longitude:@""];
    [self.param_table addObject:self.latitude?self.latitude:@""];
    [self.param_table addObject:self.invited?self.invited:@""];
    [self.param_table addObject:self.visible?self.visible:@""];
    [self.param_table addObject:self.photos?self.photos:@""];
    
    return true;
}

@end
