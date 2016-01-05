//
//  API_user_sendmail.m
//  Enjoyney
//
//  Created by Andrew Liu on 12/2/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_user_sendmail.h"

@implementation API_user_sendmail

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.email]) {
        return true;
    }
    if(![API_Base is_object_valid:self.title]) {
        return true;
    }
    if(![API_Base is_object_valid:self.content]) {
        return true;
    }
    
    return false;
}

+(NSString*) CMD {
    return @"user.sendmail";
}

+(API_user_sendmail *) create:(id)view_model user_id:(id)user_id email:(id)email title:(id)title content:(id)content {
    
    API_user_sendmail *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model= view_model;
    model.command   = [self CMD];
    
    // 手写
    model.user_id           = user_id;
    model.email             = email;
    model.title             = title;
    model.content           = content;
    
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
    [self.param_table addObject:self.email?self.email:@""];
    [self.param_table addObject:self.title?self.title:@""];
    [self.param_table addObject:self.content?self.content:@""];

    return true;
}


@end
