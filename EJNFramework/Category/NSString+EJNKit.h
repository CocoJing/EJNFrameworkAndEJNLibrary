//
//  NSString+EJNKitKit.h
//
//  Created by fuqiang on 13-11-12.
//  Copyright (c) 2013年 Enjoyney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EJNKit)

/**
 *  判断字符串是否为空
 */
+ (BOOL)IsNilOrEmpty:(NSString *)str;

/**
 *  trim掉换行和空格
 */
- (NSString*)trimString;

/**
 *  判断字符串是否为纯整型
 */
- (BOOL)isPureInt;

/**
 *  判断字符串是否为纯小数
 */
- (BOOL)isPureDecimal;

/**
 *  获取首字母
 */
- (NSString *)firstLetter;

- (NSString*)capitalizeFirstWord;

/**
 *  根据最大宽度和字体获取高度
 */
- (CGFloat)heightForWidth:(CGFloat)width withFont:(UIFont*)font;

/**
 *  根据最大宽度和字体获取合适size
 */
- (CGSize)sizeForWidth:(CGFloat)width withFont:(UIFont*)font;

/**
 *  单行根据字体和最大宽度获取实际宽度
 */
- (CGFloat)singleWidthWithMaxWidth:(CGFloat)width withFont:(UIFont*)font;

/**
 *  单行模式下，获取高度
 */
- (CGFloat)singleHeightWithFont:(UIFont*)font;


/**
 *  单行模式下，获取size根据最大宽度
 */
- (CGSize)singleSizeWithMaxWidth:(CGFloat)width withFont:(UIFont*)font;

/**
 *  正常形式下的电话号码，只保留0123456789+这些字符
 */
- (NSString *)normalizedPhoneNumber;

/**
 *  去除了空格和换行的字符串
 */
- (NSString*)noSpaceString;

/**
 *  可旋转的绘制文字方法,basePoint为中间位置
 */
- (void)drawWithBasePoint:(CGPoint)basePoint andAngle:(CGFloat)angle andFont:(UIFont *)font andColor:(UIColor*)color;



-(NSString *)methodsToJSON:(NSDictionary*)dicMethods;


@end
