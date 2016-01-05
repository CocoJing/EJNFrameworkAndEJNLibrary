//
//  MDL_activity_list.m
//  Enjoyney
//
//  Created by 傅强 on 15/8/3.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "ETY_Activity.h"

#import "MDL_activity_list.h"

@implementation MDL_activity_list

+ (NSDictionary *)objectClassInArray
{
    return @{ @"data" : [ETY_Activity class] };
}

@end
