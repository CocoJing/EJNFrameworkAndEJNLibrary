//
//  API_user_sendmail.h
//  Enjoyney
//
//  Created by Andrew Liu on 12/2/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_user_sendmail : API_Base


@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id email;
@property (nonatomic,strong) id title;
@property (nonatomic,strong) id content;

+(API_user_sendmail *) create:(id)view_model user_id:(id)user_id email:(id)email title:(id)title content:(id)content;

@end
