//
//  FrequentUrlManager.h
//  
//
//  Created by meishichina on 10/15/13.
//  Copyright (c) 2013 chenyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FrequentUrlManager : NSObject

@property(nonatomic, copy) NSString* savedFrequentUrlParams;
@property(nonatomic, retain) NSNumber* savedFrequentUrlParamsTimeSP;

+ (FrequentUrlManager*) sharedInstance;

-(void)clearFrequentUrlParams;

-(void)isFrequentRequest:(NSString*)params rHandler:(void (^)(BOOL isFrequentRequest))rHandler;

@end
