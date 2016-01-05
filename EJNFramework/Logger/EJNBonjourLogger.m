//
//  NCCWLLogger.m
//
//  Created by nickcheng on 13-3-18.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "EJNBonjourLogger.h"
#import "LoggerClient.h"

@implementation EJNBonjourLogger {
    
}

static Logger *_DDNSLogger_logger = nil;

+ (EJNBonjourLogger *)sharedInstance {
    static EJNBonjourLogger *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EJNBonjourLogger alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    
    if (self = [super init]) {
        // create and remember the logger instance
        _DDNSLogger_logger = LoggerInit();
        
        // configure the logger
        LoggerSetOptions(_DDNSLogger_logger,
                         kLoggerOption_BufferLogsUntilConnection |
                         kLoggerOption_BrowseBonjour |
                         kLoggerOption_BrowseOnlyLocalDomain );
        
        LoggerStart(_DDNSLogger_logger);
        
    }
    return self;
}

- (void)logMessage:(DDLogMessage *)logMessage {
	NSString *logMsg = logMessage->logMsg;
    
	if (formatter) {
        // formatting is supported but not encouraged!
		logMsg = [formatter formatLogMessage:logMessage];
    }
    
	if (logMsg)	{
        int nsloggerLogLevel;
		switch (logMessage->logFlag) {
            // NSLogger log levels start a 0, the bigger the number,
            // the more specific / detailed the trace is meant to be
			case LOG_FLAG_ERROR : nsloggerLogLevel = 0; break;
			case LOG_FLAG_WARN  : nsloggerLogLevel = 1; break;
			case LOG_FLAG_INFO  : nsloggerLogLevel = 2; break;
			case LOG_FLAG_DEBUG : nsloggerLogLevel = 3; break;
			default             : nsloggerLogLevel = 4; break;
		}
        
        NSString *logFile  = [[[NSString stringWithUTF8String:logMessage->file] componentsSeparatedByString:@"/"] lastObject];
        
        LogMessageF([logFile UTF8String],
                    logMessage->lineNumber,
                    logMessage->function,
                    @"",    nsloggerLogLevel,
                    @"%@",  logMsg);
    }
}

- (NSString *)loggerName {
	return @"com.enjoyney.lumberjack.NSLogger";
}

@end
