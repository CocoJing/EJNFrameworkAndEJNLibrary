//
//  FrequentUrlManager.m
//
//
//  Created by meishichina on 10/15/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import "FrequentUrlManager.h"

@implementation FrequentUrlManager

+ (FrequentUrlManager*) sharedInstance
{
    static FrequentUrlManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FrequentUrlManager alloc] init];
    });
    return sharedInstance;
}

-(void)clearFrequentUrlParams {
    self.savedFrequentUrlParams        = nil;
    self.savedFrequentUrlParamsTimeSP  = nil;
}

-(void)isFrequentRequest:(NSString *)params rHandler:(void (^)(BOOL))rHandler {
        
    BOOL isFrequentRequest = NO;
    
    NSNumber* curTimeSP = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
//    DDLogDebug(@"\n保存的请求时间戳 is: %@ \n保存的请求 is: %@\n待比对请求时间戳 is: %@ \n待比对请求 is: %@\n",
//               self.savedFrequentUrlParamsTimeSP, self.savedFrequentUrlParams, curTimeSP, params);
    
    if (self.savedFrequentUrlParamsTimeSP && self.savedFrequentUrlParams) {
//        DDLogDebug(@"比对请求时间戳差 %f", ([curTimeSP doubleValue] - [self.savedFrequentUrlParamsTimeSP doubleValue]));
        
        // 500毫秒内的重复请求
        if (([curTimeSP doubleValue] - [self.savedFrequentUrlParamsTimeSP doubleValue]) <= 0.5 &&
            [params isEqualToString:self.savedFrequentUrlParams]) {
            isFrequentRequest = YES;
            
            DDLogDebug(@"500毫秒内重复请求: %@", params);
        }
    }
    
    self.savedFrequentUrlParams       = params;
    self.savedFrequentUrlParamsTimeSP = curTimeSP;
    
    rHandler(isFrequentRequest);
}

@end
