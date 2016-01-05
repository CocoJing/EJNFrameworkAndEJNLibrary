//
//  API_activity_inviteds.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/13/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_activity_inviteds : API_Base

@property (nonatomic,strong) id activity_id;
@property (nonatomic,strong) id page;
@property (nonatomic,strong) id pagesize;

/**
 活动activity_id
 页码：page
 提取条数：pagesize
 */
+(API_activity_inviteds *) create:(id)view_model activity_id:(id)activity_id page:(id)page pagesize:(id)pagesize;


@end
