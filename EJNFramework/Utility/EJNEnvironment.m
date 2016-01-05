//
//  EJNEnvironment.m
//  Enjoyney
//
//  Created by 傅强 on 15/7/26.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import <sys/sysctl.h>

#import "EJNUUID.h"

#import "EJNEnvirmentPrefs.h"

#define APPNAME             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APPLOCALIZEDNAME    [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"]

#define APPIDENTIFIER       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
#define APPBUILDNUMBER      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APPBUILDVERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]


#import "EJNEnvironment.h"

@implementation EJNEnvironment

+ (void)configWithAppKey:(NSString *)appKey
{
    EJNEnvirmentPrefs *envPreferences   = [EJNEnvirmentPrefs sharedInstance];
    
    envPreferences.udid                 = [EJNEnvironment getUDID];
    
    envPreferences.appKey               = appKey;
    envPreferences.appBuildName         = [EJNEnvironment getAppName];  //! 获取当前应用名称
    envPreferences.appBuildNumber       = APPBUILDNUMBER;               //! 获取当前版本号, 比如 "1.0.0"
    envPreferences.appBuildVersion      = APPBUILDVERSION;              //! 获取编译版本号, 比如 "1000"
    envPreferences.appBundleIdentifier  = APPIDENTIFIER;                //! 获取当前应用包名
    
    envPreferences.deviceName           = [EJNEnvironment getDeviceName];
    envPreferences.deviceScreen         = [EJNEnvironment getDeviceScreen];
    envPreferences.deviceOSVersion      = [EJNEnvironment getDeviceOSVersion];
    envPreferences.osLanguage           = [EJNEnvironment getOSLanguage];
    
    envPreferences.longitude            = 0;
    envPreferences.latitude             = 0;
}

+(NSString *)getOSLanguage {
    NSUserDefaults *defaults    = [NSUserDefaults standardUserDefaults];
    NSArray *languages          = [defaults objectForKey:@"AppleLanguages"];
    return [languages objectAtIndex:0];
}

//! 获取客户端唯一标识
+ (NSString *)getUDID
{
    NSString *uuid = [EJNUUID UUID];
#if TARGET_IPHONE_SIMULATOR
    uuid = [@"SIMULATOR-" stringByAppendingString:uuid];
#endif
    return uuid;
}

+ (NSString *)getAppName
{
    NSString *appName = APPLOCALIZEDNAME;
    if ( !appName ) {
        appName = APPNAME;
    }
    return appName;
}

//! 获取完整的版本号信息: 比如 "4.3.0 (1024)"
+ (NSString *)getAppFullVersion
{
    return [NSString stringWithFormat:@"%@ (%@)", APPBUILDNUMBER, APPBUILDVERSION];
}

//! 获取客户端标识
+ (NSString *)getUserAgent
{
    UIDevice *device        = [UIDevice currentDevice];
    NSString *deviceName    = [device model];
    NSString *osName        = [device systemName];
    NSString *osVersion     = [device systemVersion];
    
    NSString *locale        = [[NSLocale currentLocale] localeIdentifier];
    NSString *UA            = [NSString stringWithFormat:@"iOS %@ rv:%@ (%@; %@ %@; %@)",
                               APPBUILDVERSION, APPBUILDNUMBER, deviceName, osName, osVersion, locale];
    return UA;
}

//! 获取设备分辨率
+ (NSString *)getDeviceScreen
{
    CGRect rect     = [[UIScreen mainScreen] bounds];
    CGFloat scale   = [[UIScreen mainScreen] scale];
    return [NSString stringWithFormat:@"%.fx%.f", rect.size.width*scale, rect.size.height*scale];
}

//! 获取设备系统
+ (NSString *)getDeviceOSVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

//! 获取设备名
+ (NSString *)getDeviceName
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *machineName = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    machineName = [self machineNameForModelIdentifier:machineName];
    
    free(machine);
    return machineName;
}

+ (NSString *)machineNameForModelIdentifier:(NSString *)modelIdentifier {
    
    // iPhone http://theiphonewiki.com/wiki/IPhone
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"]) return @"iPhone 1G";
    if ([modelIdentifier isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([modelIdentifier isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([modelIdentifier isEqualToString:@"iPhone3,1"]) return @"iPhone 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone3,2"]) return @"iPhone 4 (GSM Rev A)";
    if ([modelIdentifier isEqualToString:@"iPhone3,3"]) return @"iPhone 4 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([modelIdentifier isEqualToString:@"iPhone5,1"]) return @"iPhone 5 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,2"]) return @"iPhone 5 (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone5,3"]) return @"iPhone 5c (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone5,4"]) return @"iPhone 5c (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone6,1"]) return @"iPhone 5s (GSM)";
    if ([modelIdentifier isEqualToString:@"iPhone6,2"]) return @"iPhone 5s (Global)";
    if ([modelIdentifier isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus (A1522/A1524)";
    if ([modelIdentifier isEqualToString:@"iPhone7,2"]) return @"iPhone 6 (A1549/A1586)";
    
    // iPad http://theiphonewiki.com/wiki/IPad
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"]) return @"iPad 1G";
    if ([modelIdentifier isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad2,2"]) return @"iPad 2 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([modelIdentifier isEqualToString:@"iPad2,4"]) return @"iPad 2 (Rev A)";
    if ([modelIdentifier isEqualToString:@"iPad3,1"]) return @"iPad 3 (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad3,2"]) return @"iPad 3 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,3"]) return @"iPad 3 (Global)";
    if ([modelIdentifier isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad3,5"]) return @"iPad 4 (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad3,6"]) return @"iPad 4 (Global)";
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"]) return @"iPad Air (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad4,2"]) return @"iPad Air (Cellular)";
    
    // iPad Mini http://theiphonewiki.com/wiki/IPad_mini
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"]) return @"iPad mini 1G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad2,6"]) return @"iPad mini 1G (GSM)";
    if ([modelIdentifier isEqualToString:@"iPad2,7"]) return @"iPad mini 1G (Global)";
    if ([modelIdentifier isEqualToString:@"iPad4,4"]) return @"iPad mini 2G (WiFi)";
    if ([modelIdentifier isEqualToString:@"iPad4,5"]) return @"iPad mini 2G (Cellular)";
    
    // iPod http://theiphonewiki.com/wiki/IPod
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"]) return @"iPod touch 1G";
    if ([modelIdentifier isEqualToString:@"iPod2,1"]) return @"iPod touch 2G";
    if ([modelIdentifier isEqualToString:@"iPod3,1"]) return @"iPod touch 3G";
    if ([modelIdentifier isEqualToString:@"iPod4,1"]) return @"iPod touch 4G";
    if ([modelIdentifier isEqualToString:@"iPod5,1"]) return @"iPod touch 5G";
    if ([modelIdentifier isEqualToString:@"iPod7,1"]) return @"iPod Touch 6G";
    
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"] || [modelIdentifier isEqual:@"x86_64"]) {
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }
    
    return modelIdentifier;
}


@end
