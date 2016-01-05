//
//  NCCWLFormatter.m
//
//  Created by nickcheng on 13-3-18.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "EJNLogFormatter.h"

@implementation EJNLogFormatter {
  NSDateFormatter *_dateFormatter;
}

- (id)init {
  if((self = [super init])) {
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss:SSS"];
  }
  return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *logLevel;
    switch (logMessage->logFlag) {
        case LOG_FLAG_ERROR : logLevel = @"Eror:";    break;
        case LOG_FLAG_WARN  : logLevel = @"Warn:";    break;
        case LOG_FLAG_DEBUG : logLevel = @"Debug:";   break;
        case LOG_FLAG_INFO  : logLevel = @"Info:";    break;
        default             : logLevel = @"Verb:";    break;
    }
    
    NSString *logTime = [_dateFormatter stringFromDate:(logMessage->timestamp)];
    NSString *logMsg  = logMessage->logMsg;
    NSString *logFunc = [NSString stringWithUTF8String:logMessage->function];
    NSString *logFile = [[[NSString stringWithUTF8String:logMessage->file] componentsSeparatedByString:@"/"] lastObject];

    return [NSString stringWithFormat:@"\n%@(%@) <%@ ( %@%d )> %@\n%@\n",
            logTime, [logMessage threadID], logFile, logFunc, logMessage->lineNumber, logLevel, logMsg];
}

@end
