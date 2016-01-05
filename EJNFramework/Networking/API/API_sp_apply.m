//
//  API_sp_apply.m
//  Enjoyney
//
//  Created by Andrew Liu on 9/21/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import "API_sp_apply.h"

@implementation API_sp_apply

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
 
    if(![API_Base is_object_valid:self.userID]) {
        return true;
    }
    if(![API_Base is_object_valid:self.firstName]) {
        return true;
    }
    if(![API_Base is_object_valid:self.lastName]) {
        return true;
    }
    if(![API_Base is_object_valid:self.gender]) {
        return true;
    }
    if(![API_Base is_object_valid:self.birthday]) {
        return true;
    }
    if(![API_Base is_object_valid:self.phonNumber]) {
        return true;
    }
    if(![API_Base is_object_valid:self.location]) {
        return true;
    }
    if(![API_Base is_object_valid:self.services]) {
        return true;
    }
    if(![API_Base is_object_valid:self.aboutMe]) {
        return true;
    }
    
    return false;
}


+(NSString*) CMD {
    return @"sp.apply";
}


+(API_sp_apply *) create:(id)view_model userID:(id)userID firstName:(id)firstName lastName:(id)lastName gender:(id)gender
                birthday:(id)birthday phonNumber:(id)phonNumber location:(id)location services:(id)services aboutMe:(id)aboutMe {
    
    API_sp_apply *model = [[self alloc] init];
    if( !model ) {
        return nil;
    }
    
    model.view_model    = view_model;
    model.command       = [self CMD];
    
    // 邮箱
    model.userID        = userID;
    model.firstName   	= firstName;
    model.lastName   	= lastName;
    model.gender        = gender;
    model.birthday   	= birthday;
    model.phonNumber   	= phonNumber;
    model.location  	= location;
    model.services      = services;
    model.aboutMe       = aboutMe;
    
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
    
    [self.param_table addObject:self.userID?self.userID:@""];
    [self.param_table addObject:self.firstName?self.firstName:@""];
    [self.param_table addObject:self.lastName?self.lastName:@""];
    [self.param_table addObject:self.gender?self.gender:@""];
    [self.param_table addObject:self.birthday?self.birthday:@""];
    [self.param_table addObject:self.phonNumber?self.phonNumber:@""];
    [self.param_table addObject:self.location?self.location:@""];
    [self.param_table addObject:self.services?self.services:@""];
    [self.param_table addObject:self.aboutMe?self.aboutMe:@""];

    return true;
}

@end
