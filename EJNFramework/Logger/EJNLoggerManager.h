//
//  NCCWL.h
//
//  Created by nickcheng on 13-3-18.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "DDLog.h"

// CocoaLumberjack Default Logging Level
extern int ddLogLevel;

/**
 *  公司内部调试接口/线上接口切换开关
 *  上线必须调整成 NO
 */
extern BOOL isCompanyDebug;

/**
 *  开发阶段内部调试接口/线上接口切换开关
 *  上线必须调整成 NO
 */
extern BOOL isDebugAPI;
/**
 *  开发阶段调试账号
 *  上线需清除
 */
extern NSString* debugAccounts;


#define DDLogMethod()           DDLogInfo(@"%@ --> %@",     self, NSStringFromSelector(_cmd));
#define DDLogMethodParam(param) DDLogInfo(@"%@ --> %@%@",   self, NSStringFromSelector(_cmd), param);


@interface EJNLoggerManager : EJNNSObject

+ (EJNLoggerManager*)sharedInstance;

@end