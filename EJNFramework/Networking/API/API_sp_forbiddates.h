//
//  API_sp_forbiddates.h
//  Enjoyney
//
//  Created by Andrew Liu on 10/8/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_sp_forbiddates : API_Base

@property (nonatomic,strong) id userID;

+(API_sp_forbiddates *) create:(id)view_model userID:(id)userID;

@end
