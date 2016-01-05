//
//  Enjoyney_EJNFramework_pch
//  EJNFramework
//
//  Created by ryanfu on 14-10-13.
//  Copyright (c) 2014年 Enjoyney. All rights reserved.
//

#ifndef Enjoyney_EJNFramework_pch
#define Enjoyney_EJNFramework_pch

#import "EJNLoggerManager.h"

#import "NSString+EJNKit.h"

/*************************************************/
/* 配置参数                                       */
/*************************************************/

#define DOCUMENT                    [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

/*************************************************/
/* 网络 配置参数                                   */
/*************************************************/

#define URL_HOST                    @"http://ios.api.prod.knecta.net"
#define URL_HOST_DEBUG              @"http://ios.meetup.late4.com"

#define API_CODE_OK                 0

#define API_LIST_PAGESIZE           @10

// 参数提交 key
#define KEY_REQUEST_PARAMS          @"p"
#define KEY_REQUEST_PARAMS_ID       @"i"

// 远程调试帐号
#define ACCOUNT_DEBUG               @"debug@enjoyney.com"

#endif
