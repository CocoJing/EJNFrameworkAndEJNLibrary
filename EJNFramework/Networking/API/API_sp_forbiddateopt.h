//
//  API_sp_forbiddateopt.h
//  Enjoyney
//
//  Created by Andrew Liu on 10/8/15.
//  Copyright © 2015 enjoyney. All rights reserved.
//

#import "API_Base.h"

@interface API_sp_forbiddateopt : API_Base

@property (nonatomic,strong) id userID;
@property (nonatomic,strong) id opt;
@property (nonatomic,strong) id date;

+(API_sp_forbiddateopt *) create:(id)view_model userID:(id)userID opt:(id)opt date:(id)date;

@end
