//
//  NSString+SHA.h
//  FinancialApp
//
//  Created by zhangbo on 4/4/15.
//  Copyright (c) 2015 zhangbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (SHA)

- (NSString *) sha1;
- (NSString *) sha224;
- (NSString *) sha256;
- (NSString *) sha384;
- (NSString *) sha512;
- (NSString *) md5;

+ (NSString *)dateWithTimeInterval:(double)interval; //时间戳转化为字符串


@end
