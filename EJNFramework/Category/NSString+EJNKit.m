//
//  NSString+EJNKitKit.m
//
//  Created by fuqiang on 13-11-12.
//  Copyright (c) 2013年 Enjoyney. All rights reserved.
//

#import "NSString+EJNKit.h"

@implementation NSString (EJNKit)

+ (BOOL)IsNilOrEmpty:(NSString *)string {
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (string == nil || string.length == 0) {
        return YES;
    }
    
    if([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
    {
        return YES;
    }
    return NO;
}

- (BOOL)isPureInt{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isPureDecimal{
    NSScanner *scan = [NSScanner scannerWithString:self];
    NSDecimal val;
    return [scan scanDecimal:&val] && [scan isAtEnd];
}

- (NSString*)trimString
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString*)noSpaceString
{
    NSArray* words = [self componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* nospacestring = [words componentsJoinedByString:@""];
    return nospacestring;
}

- (NSString *)firstLetter
{
    if ([NSString IsNilOrEmpty:self]) {
        return @"#";
    }
    
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (__bridge CFMutableStringRef)[NSMutableString stringWithString:self]);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSMutableString *aNSString = (__bridge_transfer NSMutableString *)string;
    NSString *finalString = [aNSString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%c", 32] withString:@""];
    
    if (finalString.length<=0) {
        return @"#";
    }
    
    NSString *firstLetter = [[finalString substringToIndex:1]uppercaseString];
    if ([NSString IsNilOrEmpty:firstLetter]) {
        firstLetter = @"#";
    }else{
        unichar letter = [firstLetter characterAtIndex:0];
        if (letter<65||letter>90) {
            firstLetter = @"#";
        }
    }
    return firstLetter;
}

- (NSString*)capitalizeFirstWord {
    if(self.length == 0) {
        return self;
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[self substringToIndex:1] uppercaseString]];
}

- (CGFloat)heightForWidth:(CGFloat)width withFont:(UIFont*)font
{
    NSAssert(font, @"heightForWidth:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ceilf(size.height);
}

- (CGSize)sizeForWidth:(CGFloat)width withFont:(UIFont*)font
{
    NSAssert(font, @"heightForWidth:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    return size;
}

- (CGFloat)singleWidthWithMaxWidth:(CGFloat)width withFont:(UIFont*)font
{
    NSAssert(font, @"singleWidthWithMaxWidth:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return ceilf(size.width);
}

- (CGFloat)singleHeightWithFont:(UIFont*)font
{
    NSAssert(font, @"singleHeightWithFont:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return ceilf(size.height);
}

- (CGSize)singleSizeWithFont:(UIFont*)font
{
    NSAssert(font, @"singleHeightWithFont:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    size.height = ceilf(size.height);
    size.width = ceilf(size.width);
    
    return size;
}

- (CGSize)singleSizeWithMaxWidth:(CGFloat)width withFont:(UIFont*)font
{
    NSAssert(font, @"singleSizeWithMaxWidth:withFont:方法必须传进font参数");
    
    CGSize size = CGSizeZero;
    NSDictionary *attribute = @{NSFontAttributeName: font};
    size = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                              options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    size.height = ceilf(size.height);
    size.width = MIN(width, ceilf(size.width));
    
    return size;
}

- (NSString *)normalizedPhoneNumber {
    NSCharacterSet *nonNumericSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789+"] invertedSet];
    return [[self componentsSeparatedByCharactersInSet:nonNumericSet] componentsJoinedByString:@""];
}


- (void)drawWithBasePoint:(CGPoint)basePoint andAngle:(CGFloat)angle andFont:(UIFont *)font andColor:(UIColor*)color
{
    CGSize  textSize    =   [self singleSizeWithFont:font];
    
    CGContextRef    context =   UIGraphicsGetCurrentContext();
    CGAffineTransform   t   =   CGAffineTransformMakeTranslation(basePoint.x, basePoint.y);
    CGAffineTransform   r   =   CGAffineTransformMakeRotation(angle);
    
    CGContextConcatCTM(context, t);
    CGContextConcatCTM(context, r);
    
    NSDictionary *attribute = @{NSFontAttributeName: font,NSForegroundColorAttributeName:color};
    [self drawAtPoint:CGPointMake(-1 * textSize.width / 2, -1 * textSize.height / 2)
       withAttributes:attribute];
    
    CGContextConcatCTM(context, CGAffineTransformInvert(r));
    CGContextConcatCTM(context, CGAffineTransformInvert(t));
}

/**
 *  组拼JSON 各方法拼合
 *
 *  @param json
 *
 *  @return
 */
-(NSString *)methodsToJSON:(NSDictionary*)dicMethods {
    // method json 组装
    NSMutableString *methodsString = [NSMutableString stringWithString:@""];
    for (NSDictionary *method in [dicMethods allValues]) {
        if (method) {
            // 添加到最终请求methodjson字符串中
            [methodsString appendFormat:@",%@", method];
        }
    }
    
    // 去除前部的逗号分割符
    if ([methodsString length] > 0)
        [methodsString deleteCharactersInRange:NSMakeRange(0, 1)];
    
    return methodsString;
}

@end
