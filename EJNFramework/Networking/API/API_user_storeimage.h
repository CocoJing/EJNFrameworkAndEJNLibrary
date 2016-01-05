//
//  API_user_storeimage.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/24/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_user_storeimage : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id url;

/**
 user_id,   int : 当前登录用户ID - required
 url,       string : 图片路径 - required
 */

+(API_user_storeimage *) create:(id)view_model user_id:(id)user_id url:(id)url;

@end
