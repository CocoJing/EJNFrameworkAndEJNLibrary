//
//  HttpTool.h
//  Demo2
//
//  Created by account on 15/5/11.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

typedef void (^SUCCESSCALLBACK)(NSDictionary *resultDic);
typedef void (^FAILURECALLBACK)(NSError *error);
typedef void (^PROGRESSCALLBACK)(double percent);

@interface NetworkManager : EJNNSObject

+ (void)requestWithMethods:(NSString *)apiMethods
                   success:(SUCCESSCALLBACK)successCallback
                   failure:(FAILURECALLBACK)failureCallback;

+ (void)requestWithMethods:(NSString *)apiMethods
                 withDatas:(NSArray  *)dataArray
                  progress:(PROGRESSCALLBACK)progressCallback
                   success:(SUCCESSCALLBACK)successCallback
                   failure:(FAILURECALLBACK)failureCallback;



+ (id)syncRequestWithMethods:(NSString *)apiMethods
                       error:(NSError *__autoreleasing *)outError;

@end
