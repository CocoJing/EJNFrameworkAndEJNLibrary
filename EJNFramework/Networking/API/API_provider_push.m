//
//  API_provider_main.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_provider_push.h"

@implementation API_provider_push

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"provider.push";
}

+(API_provider_push *) create:(id)view_model {
    
    API_provider_push *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
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

    return true;
}

@end