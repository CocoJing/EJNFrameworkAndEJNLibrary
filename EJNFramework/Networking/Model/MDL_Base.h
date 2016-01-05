//
//  EJNUser.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/25.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

@interface MDL_Base : EJNNSObject

@property (nonatomic,assign) NSInteger  code;
@property (nonatomic,assign) NSInteger  cache;

@property (nonatomic,strong) NSString   *msg;

@property (nonatomic,strong) id         data;

@end
