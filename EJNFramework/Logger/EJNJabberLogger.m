//
//  MSCRemoteLogger.m
//
//  Created by meishichina on 5/16/13.
//  Copyright (c) 2013 MSC. All rights reserved.
//

#import "EJNJabberLogger.h"

@implementation EJNJabberLogger


+(EJNJabberLogger*) sharedInstance
{
    static dispatch_once_t pred = 0;
    static EJNJabberLogger *_sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

-(void) logMessage:(DDLogMessage *)logMessage
{
    /* 加入判断
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR :
        case LOG_FLAG_WARN  :
        {
            NSString *logMsg = logMessage->logMsg;
            
            if (formatter) {
                logMsg = [formatter formatLogMessage:logMessage];
            }
            
            if (logMsg) {
                NSString *logFunc = [NSString stringWithUTF8String:logMessage->function];
                NSString *logFile = [[[NSString stringWithUTF8String:logMessage->file]
                                      componentsSeparatedByString:@"/"] lastObject];
                
                NSString *log = [NSString stringWithFormat:@"<%@ -> %@ %d>\n %@",
                                 logFile, logFunc, logMessage->lineNumber, logMessage->logMsg];
                
                [[DataService sharedInstance] remoteLog:log
                                               sHandler:^(id viewModel) {}
                                               fHandler:^(int ecode, NSString *descr) {}];
            }
        }
            break;
    }
    */
}

@end
