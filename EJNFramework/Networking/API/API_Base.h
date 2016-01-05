//
//  rootmodel.h
//  DSDNetTest
//
//  Created by lipeifeng on 15/3/26.
//  Copyright (c) 2015年 lipeifeng. All rights reserved.
//

@interface API_Base : EJNNSObject

@property (nonatomic,strong) id command;
@property (nonatomic,strong) id view_model;
@property (nonatomic,strong) id param_table;
@property (nonatomic,strong) id file_table;

+(NSString*) CMD;


+(BOOL)is_object_valid:(id)object;

+(id)checkParam:(id)object;

+(NSString *)json_from_model:(API_Base *)model;


@end
