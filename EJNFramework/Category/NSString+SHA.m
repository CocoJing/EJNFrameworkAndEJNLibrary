//
//  NSString+SHA.m
//  FinancialApp
//
//  Created by zhangbo on 4/4/15.
//  Copyright (c) 2015 zhangbo. All rights reserved.
//

#import "NSString+SHA.h"

@implementation NSString (SHA)

- (NSString*) sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString*) sha224
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA224_DIGEST_LENGTH];
    
    CC_SHA224(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA224_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA224_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString*) sha256
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString*) sha384
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA384_DIGEST_LENGTH];
    
    CC_SHA384(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA384_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA384_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString*) sha512
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA512_DIGEST_LENGTH];
    
    CC_SHA512(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA512_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}

+ (NSString *)dateWithTimeInterval:(double)interval
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate *confromTimesp       = [NSDate dateWithTimeIntervalSince1970:interval];
    NSString *confromTimespStr  = [formatter stringFromDate:confromTimesp];
    if ([confromTimespStr isEqual:@"1970-01-01"]) {
        confromTimespStr = @"-";
    }
    return confromTimespStr;
}


/*
 *  组拼JSON 公共参数＋加密方法
 *
 *  @param json API方法json字符串
 *
 *  @return 返回
 1.含公共参数的经Base64编码的JSON p参数字符串
 2.含公共参数的经MD5编码的JSON 校验参数字符串
-(NSDictionary*)secretJSON:(NSString*)JSONString {
    // 环境
    EJNEnvirmentPrefs *envPreferences = [EJNEnvirmentPrefs sharedInstance];
    
    // 参数准备
    NSString *timer = [RequestJsonMaker getCurrentTime];
    
    // u
    NSMutableString* uJSON = [NSMutableString stringWithString:@""];
    [uJSON appendFormat:@"\"uid\":\"%@\"",      @""];
    
    // d
    NSMutableString *dJSON = [NSMutableString stringWithString:@""];
    [dJSON appendFormat:@"\"udid\":\"%@\",",        envPreferences.udid];
    [dJSON appendFormat:@"\"screen\":\"%@\",",      envPreferences.deviceScreen];
    [dJSON appendFormat:@"\"dname\":\"%@\",",       envPreferences.deviceName];
    [dJSON appendFormat:@"\"osver\":\"%@\",",       envPreferences.deviceOSVersion];
    [dJSON appendFormat:@"\"longitude\":\"%lf\",",  envPreferences.longitude];
    [dJSON appendFormat:@"\"latitude\":\"%lf\",",   envPreferences.latitude];
    [dJSON appendFormat:@"\"language\":\"%@\"",     envPreferences.osLanguage];
    
    // a
    NSMutableString *aJSON = [NSMutableString stringWithString:@""];
    [aJSON appendFormat:@"\"timer\":\"%@\",",       timer]; // 时间戳
    [aJSON appendFormat:@"\"pname\":\"%@\",",       envPreferences.appBundleIdentifier];
    [aJSON appendFormat:@"\"aname\":\"%@\",",       envPreferences.appBuildName];
    [aJSON appendFormat:@"\"akey\":\"%@\",",        envPreferences.appKey];
    [aJSON appendFormat:@"\"aver\":\"%@\"",         envPreferences.appBuildVersion];
    
    // s
    NSMutableString *sJSON = [NSMutableString stringWithString:@"{"];
    [sJSON appendFormat:@"\"timer\":\"%@\",",       timer]; // 时间戳
    [sJSON appendFormat:@"\"identifier\":\"%@\",",  envPreferences.appBundleIdentifier];
    [sJSON appendFormat:@"\"openudid\":\"%@\",",    envPreferences.udid];
    [sJSON appendFormat:@"\"app\":\"%@v%@\"",       envPreferences.appKey, envPreferences.appBuildVersion];
    [sJSON appendString:@"}"];
    // MD5校验值
    NSString *sMD5 = [EJNSecure encryptMD5String:sJSON];
    
    // p all
    NSMutableString *pJSON = [NSMutableString stringWithString:@"{"];
    // d 设备信息
    [pJSON appendFormat:@"\"d\":{%@},",     dJSON];
    // a APP信息
    [pJSON appendFormat:@"\"a\":{%@},",     aJSON];
    // u 用户信息
    [pJSON appendFormat:@"\"u\":{%@},",     uJSON];
    // m 业务接口
    [pJSON appendFormat:@"\"m\":{%@},",     mJSON];
    // s MD5校验值
    [pJSON appendFormat:@"\"s\":\"%@\"",    sMD5];
    [pJSON appendString:@"}"];
    
    NSString *mMD5   = [EJNSecure encryptMD5String:mJSON];
    //NSString *base64 = [EJNSecure base64StringFromText:pJSON];
    
    NSString *base64 = [pJSON stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
#if DEBUG
    DDLogDebug(@"MD5原文\n%@\n\nMD5\n%@\n\n原文\n%@\n\n编码\n%@\n\n解码\n%@", sJSON, sMD5, pJSON, base64, [EJNSecure textFromBase64String:base64]);
#endif
    return @{ KEY_REQUEST_PARAMS_ID : mMD5, KEY_REQUEST_PARAMS : base64 };
}

+(NSString*)getCurrentTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"ABC"];
    [dateFormatter setTimeZone:gmt];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}
*/




@end
