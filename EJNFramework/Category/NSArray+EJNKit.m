//
//  EJNKit.m
//  Enjoyney
//
//  Created by 傅强 on 15/8/7.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "NSArray+EJNKit.h"

@implementation NSArray (EJNKit)

- (id)objectAtIndexCheck:(NSUInteger)index
{
    if (index >= [self count]) {
        return nil;
    }
    
    id value = [self objectAtIndex:index];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end
