//
//  EJNUUID.m
//  Enjoyney
//
//  Created by fuqiang on 9/16/14.
//  Copyright (c) 2014 Enjoyney. All rights reserved.
//

#import "EJNUUID.h"

#import <SSKeychain.h>
#import "NSString+EJNKit.h"

#define kServiceName @"uuid"

@interface EJNUUID()

@end

@implementation EJNUUID

+ (NSString *)UUID
{
    //从keychain里找到记录的UUID
    NSString *uuid = [EJNUUID getUUIDFromKeychain];
    
    if ([NSString IsNilOrEmpty:uuid]) {
        uuid = [[UIDevice currentDevice].identifierForVendor UUIDString];
        uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [EJNUUID setUUIDIntoKeychain:uuid];
    }
    return uuid;
}

+ (NSString *)serviceName
{
    NSString *serviceName = [[NSBundle mainBundle] bundleIdentifier]?:@"";
    return [serviceName stringByAppendingString:[NSString stringWithFormat:@".%@",kServiceName]];
}

+ (NSString *)getUUIDFromKeychain
{
    NSString *serviceName = [self serviceName];
    return [SSKeychain passwordForService:serviceName account:serviceName];
}

+ (BOOL)setUUIDIntoKeychain:(NSString*)uuid
{
    NSString *serviceName = [self serviceName];
    if ([NSString IsNilOrEmpty:uuid]) {
        return [SSKeychain deletePasswordForService:serviceName account:serviceName];
    }
    return [SSKeychain setPassword:uuid forService:serviceName account:serviceName];
}

@end
