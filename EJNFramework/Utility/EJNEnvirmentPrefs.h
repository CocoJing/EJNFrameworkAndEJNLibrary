//
//  EJNEnvirmentPrefs.h
//  Enjoyney
//
//  Created by 傅强 on 15/7/26.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#import "SearchParameter.h"
#import "PAPreferences.h"

// Ensure we get an error if we forget to add @dynamic for each property
#pragma clang diagnostic push
#pragma clang diagnostic error "-Wobjc-missing-property-synthesis"

@interface EJNEnvirmentPrefs : PAPreferences

@property (nonatomic,assign) NSString* udid;

@property (nonatomic,assign) NSString* appKey;
@property (nonatomic,assign) NSString* appBuildName;
@property (nonatomic,assign) NSString* appBuildNumber;
@property (nonatomic,assign) NSString* appBuildVersion;
@property (nonatomic,assign) NSString* appBundleIdentifier;

@property (nonatomic,assign) NSString* deviceName;
@property (nonatomic,assign) NSString* deviceScreen;
@property (nonatomic,assign) NSString* deviceOSVersion;
@property (nonatomic,assign) NSString* osLanguage;

@property (nonatomic,assign) CGFloat longitude;   // 经度
@property (nonatomic,assign) CGFloat latitude;    // 纬度

// 搜索参数
@property (nonatomic,assign) SearchParameter *storedSearchParameter;

@end

#pragma clang diagnostic pop