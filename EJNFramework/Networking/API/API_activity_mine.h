//
//  API_activity_mine.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_activity_mine : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 用户ID：user_id
 页码：page
 提取条数：pagesize
 */
+(API_activity_mine *) create:(id)view_model user_id:(id)user_id page:(id)page pagesize:(id)pagesize;


@end
