//
//  rootmodel.m
//  DSDNetTest
//
//  Created by lipeifeng on 15/3/26.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

#import "API_Base.h"

#import "NSArray+EJNJSON.h"

@implementation API_Base


+(NSString*) CMD
{
    return @"";
}

+(BOOL)is_object_valid:(id)object
{
    if (object == nil ) {
        return NO;
    }
    
    if ( [object isKindOfClass:[NSString class]] ) {
        if ( [object length] == 0 ) {
            return NO;
        }
    }
    
    return YES;
}


+(id)checkParam:(id)object
{
    if (object == nil) {
        return @"";
    }
    return object;
}


+(NSString *)json_from_model:(API_Base *)model
{
    if ( [model param_table] == nil )
    {
        return @"1";
    }
    else if ( [[model param_table] count] == 0 )
    {
        return [NSString stringWithFormat:@"\"%@\":[]",[model command]];
    }
    
    return [NSString stringWithFormat:@"\"%@\":%@",[model command], [[model param_table] toJSON]];
}

@end
