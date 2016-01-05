//
//  EJNKit.h
//  Enjoyney
//
//  Created by 傅强 on 15/8/7.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (EJNKit)

/*!
 @method objectAtIndexCheck:
 @abstract 检查是否越界和NSNull如果是返回nil
 @result 返回对象
 */
- (id)objectAtIndexCheck:(NSUInteger)index;

@end
