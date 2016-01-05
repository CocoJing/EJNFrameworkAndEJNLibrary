//
//  API_provider_main.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/27.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "API_Base.h"

/// 
@interface API_service_hour : API_Base


@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id date;


/**

 * @return
 */
+(API_service_hour *) create:(id)view_model user_id:(id)user_id date:(id)date;

@end
