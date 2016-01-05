//
//  RequestJsonMaker.m
//  RecipeSprite
//
//  Created by meishichina on 11/8/13.
//
//

#import "EJNEnvirmentPrefs.h"
#import "DataService.h"
#import "EJNSecure.h"

#import "RequestJsonMaker.h"
#import "EJNUUID.h"

@interface RequestJsonMaker (private)

+(NSString*)getCurrentTime;

@end

@implementation RequestJsonMaker

/**
 *  组拼JSON 各方法拼合
 *
 *  @param json
 *
 *  @return
 */
+(NSString *)packedMethodJson:(NSDictionary*)dicMethods {
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

/*
*  组拼JSON 公共参数＋加密方法
*
*  @param json API方法json字符串
*
*  @return 返回
1.含公共参数的经Base64编码的JSON p参数字符串
2.含公共参数的经MD5编码的JSON 校验参数字符串
*/
+(NSDictionary*)packageSecretJson:(NSString*)mJSON {
    
    
    mJSON = [mJSON stringByReplacingOccurrencesOfString:@"‘" withString:@" "];
    mJSON = [mJSON stringByReplacingOccurrencesOfString:@"'" withString:@" "];
    // 环境
    EJNEnvirmentPrefs *envPreferences = [EJNEnvirmentPrefs sharedInstance];
    
    // 参数准备
    NSString *timer = [RequestJsonMaker getCurrentTime];
    
    // u
    NSMutableString* uJSON = [NSMutableString stringWithString:@""];
    [uJSON appendFormat:@"\"uid\":\"%@\"",          [GVUserDefaults standardUserDefaults].user_id];
    
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
//    [aJSON appendFormat:@"\"aname\":\"%@\",",       envPreferences.appBuildName];
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
/*
#if DEBUG
    DDLogDebug(@"MD5原文\n%@\n\nMD5\n%@\n\n原文\n%@\n\n编码\n%@\n\n解码\n%@", sJSON, sMD5, pJSON, base64, [EJNSecure textFromBase64String:base64]);
#endif
*/
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

@end
