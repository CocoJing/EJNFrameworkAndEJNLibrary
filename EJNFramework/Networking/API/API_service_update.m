//
//  API_service_update.m
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_service_update.h"

@implementation API_service_update

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 手写
    if(![API_Base is_object_valid:self.service_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.category]) {
        return true;
    }
    if(![API_Base is_object_valid:self.title]) {
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
    if(![API_Base is_object_valid:self.period]) {
        return true;
    }
    if(![API_Base is_object_valid:self.interval]) {
        return true;
    }
    if(![API_Base is_object_valid:self.price]) {
        return true;
    }
    if(![API_Base is_object_valid:self.pricedetail]) {
        return true;
    }
    if(![API_Base is_object_valid:self.desc]) {
        return true;
    }
    if(![API_Base is_object_valid:self.photoes]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"service.update";
}


+(API_service_update *) create:(id)view_model service_id:(id)service_id
                       user_id:(id)user_id category:(id)category title:(id)title
                       address:(id)address longitude:(id)longitude latitude:(id)latitude
                        period:(id)period interval:(id)interval
                         price:(id)price pricedetail:(id)pricedetail
                          desc:(id)desc photoes:(id)photoes {
    
    API_service_update *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.service_id = service_id;
    model.user_id   = user_id;
    model.category  = category;
    model.title     = title;
    model.address   = address;
    model.longitude = longitude;
    model.latitude  = latitude;
    model.period    = period;
    model.interval  = interval;
    model.price     = price;
    model.pricedetail  = pricedetail;
    model.desc      = desc;
    model.photoes   = photoes;
    
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
    [self.param_table addObject:self.user_id?self.user_id:@""];
    [self.param_table addObject:self.category?self.category:@""];
    [self.param_table addObject:self.title?self.title:@""];
    [self.param_table addObject:self.address?self.address:@""];
    [self.param_table addObject:self.longitude?self.longitude:@""];
    [self.param_table addObject:self.latitude?self.latitude:@""];
    [self.param_table addObject:self.period?self.period:@""];
    [self.param_table addObject:self.interval?self.interval:@""];
    [self.param_table addObject:self.price?self.price:@""];
    [self.param_table addObject:self.pricedetail?self.pricedetail:@""];
    [self.param_table addObject:self.desc?self.desc:@""];
    [self.param_table addObject:self.photoes?self.photoes:@""];
    
    return true;
}


@end
