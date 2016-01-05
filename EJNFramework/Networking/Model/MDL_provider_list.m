//
//  MDL_provider_list.m
//  Enjoyney
//
//  Created by 傅强 on 15/8/3.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "ETY_Provider.h"

#import "MDL_provider_list.h"

@implementation MDL_provider_list

+ (NSDictionary *)objectClassInArray
{
    return @{ @"data" : [ETY_Provider class] };
}

@end
