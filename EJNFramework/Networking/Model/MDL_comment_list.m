//
//  MDL_comment_list.m
//  Enjoyney
//
//  Created by super on 15/10/18.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

#import "MDL_comment_list.h"
#import "ETY_Star_Comment.h"


@implementation MDL_comment_list

+ (NSDictionary *)objectClassInArray
{
    return @{ @"data" : [ETY_Star_Comment class] };
}

@end
