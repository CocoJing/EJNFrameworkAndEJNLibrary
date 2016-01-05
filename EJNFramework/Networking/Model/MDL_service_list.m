//
//  MDL_service_list.m
//  Enjoyney
//
//  Created by 傅强 on 15/8/3.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "ETY_Service.h"

#import "MDL_service_list.h"

@implementation MDL_service_list

+ (NSDictionary *)objectClassInArray
{
    return @{ @"data" : [ETY_Service class] };
}

@end
