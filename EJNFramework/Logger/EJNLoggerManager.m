//
//  NCCWL.m
//
//  Created by nickcheng on 13-3-18.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "DDTTYLogger.h"
#import "DDFileLogger.h"

#import "EJNBonjourLogger.h"
#import "EJNJabberLogger.h"
#import "EJNLogFormatter.h"
#import "EJNLoggerManager.h"

@implementation EJNLoggerManager

#pragma mark Init

+ (EJNLoggerManager *)sharedInstance {
    static EJNLoggerManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EJNLoggerManager alloc] init];
    });
    
    return sharedInstance;
}

-(id)init
{
    if (self = [super init]) {
        [self configLog];
    }
    return self;
}

#pragma mark Private Methods

- (void)configLog {
    
    EJNLogFormatter *formatter = [[EJNLogFormatter alloc] init];

    // Log output to File
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    [fileLogger setLogFormatter:formatter];
    fileLogger.maximumFileSize  = 1024 * 1024;
    fileLogger.rollingFrequency = 60 * 60 * 4;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 3;
    [DDLog addLogger:fileLogger];
    
    // Log output to IM messageserver
    // [DDLog addLogger:[EJNJabberLogger sharedInstance]];
    
#ifdef DEBUG
    // XCode Console display
    [[DDTTYLogger sharedInstance] setLogFormatter:formatter];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // NSLogger Console nearby display
    EJNBonjourLogger *bonjourLogger = [EJNBonjourLogger sharedInstance];
    [DDLog addLogger:bonjourLogger];
#endif
    
}

@end
