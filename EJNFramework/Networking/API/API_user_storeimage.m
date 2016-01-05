//
//  API_user_storeimage.m
//  Enjoyney
//
//  Created by Andrew Liu on 11/24/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_user_storeimage.h"

@implementation API_user_storeimage

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    
    if(![API_Base is_object_valid:self.url]) {
        return true;
    }
    return false;
}

+(NSString*) CMD {
    return @"user.storeimage";
}

+(API_user_storeimage *) create:(id)view_model user_id:(id)user_id url:(id)url {
    
    API_user_storeimage *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id   = user_id;
    model.url       = url;

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
    [self.param_table addObject:self.url?self.url:@""];

    return true;
}


@end
