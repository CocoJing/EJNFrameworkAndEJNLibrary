//
//  API_relation_friendremove.h
//  Enjoyney
//
//  Created by Andrew Liu on 11/10/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_relation_friendremove : API_Base

@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id target_user_id;

+(API_relation_friendremove *) create:(id)view_model user_id:(id)user_id target_user_id:(id)target_user_id;

@end
