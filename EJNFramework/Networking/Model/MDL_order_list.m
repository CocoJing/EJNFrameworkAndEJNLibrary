//
//  MDL_provider_list.m
//  Enjoyney
//
//  Created by 傅强 on 15/8/3.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "ETY_Order.h"

#import "MDL_order_list.h"

@implementation MDL_order_list

+ (NSDictionary *)objectClassInArray
{
    return @{ @"data" : [ETY_Order class] };
}

@end
