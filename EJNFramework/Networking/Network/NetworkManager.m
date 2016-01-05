//
//  HttpTool.m
//  Demo2
//
//  Created by account on 15/5/11.
//  Copyright (c) 2015年 zhuli8. All rights reserved.
//

#import <SVProgressHUD.h>
#import "AFNetworking.h"
#import <AFHTTPRequestOperationManager+Synchronous.h>

#import "RequestJsonMaker.h"

#import "NetworkManager.h"

@implementation NetworkManager

#pragma mark 请求执行前的网络判断
/**
 *  检查网络状态和你顺序执行的请求没有在一个线程里，于是用了 NSOperationQueue 来控制，当网络状态不可用的时候会发出通知，这时候你所执行的请求会被立刻中断执行回到failure里，回来的错误如果是 NSURLErrorNotConnectedToInternet 就是网络不好，否则就是服务器故障。
 */
+(BOOL)beforeExecute:(AFHTTPRequestOperationManager *)manager
{
    NSOperationQueue *operationQueue = manager.operationQueue;

    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusUnknown:
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return YES;
}

+(BOOL)afterExecute:(NSError *)error
{
    //网络状态不佳的时候应该提示用户“网络不给力”
    if ([error code] == NSURLErrorNotConnectedToInternet) {
        [self alertErrorMessage:NSLocalizedString(@"Check your internet connection, then try it again", nil)];
        
        return NO;
    }
    
    //API异常应该提示出 服务器错误，请稍后刷新重试。
    [self alertErrorMessage:NSLocalizedString(@"Server error, try it later", nil)];
    
    return YES;
}

#pragma mark 请求执行后的错误信息提示

+(void)alertErrorMessage:(NSString *)message {
    [SVProgressHUD showErrorWithStatus:message];
}

#pragma mark -
#pragma mark - 私有方法


#pragma mark 网络数据请求

+(void)requestWithMethods:(NSString *)apiMethods
                   success:(SUCCESSCALLBACK)successCallback
                   failure:(FAILURECALLBACK)failureCallback {
    // 1、创建请求操作管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring,网络只有在startMonitoring完成后才可以使用检查网络状态。
    if ( ![self beforeExecute:manager] ) {
        [self alertErrorMessage:NSLocalizedString(@"Check your internet connection, then try it agen", nil)];
        return;
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer.timeoutInterval = 10.0;
    
    // 2、准备相关请求参数
    NSDictionary *dicSecretJson = [RequestJsonMaker packageSecretJson:apiMethods];
    
    NSString *idvalue   = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS_ID];
    NSString *postvalue = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS];
    
    NSString *baseURL   = nil;
    if (isDebugAPI)
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST_DEBUG, idvalue];
    else
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST, idvalue];
    
    NSString* strAfterDecodeByUTF8AndURI = [postvalue stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DDLogDebug(@"请求参数\n%@\n%@", baseURL, strAfterDecodeByUTF8AndURI);
    
    void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        DDLogDebug(@"%@", [error localizedDescription]);
        [self afterExecute:error];
        
        if (failureCallback) {
            failureCallback(error);
        }
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject)  {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            DDLogDebug(@"请求返回\n%@\n%@", baseURL, operation.responseString);
            if (successCallback) {
                successCallback(responseObject);
            }
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
        else {
            NSError *error = [NSError errorWithDomain:@"com.enjoyneyinc.enjoyney" code:1 userInfo:@{@"error":@"返回数据解析错误"}];
            failureBlock(operation, error);
        }
    };
    
    // 3、发送POST请求
    [manager POST:baseURL parameters:@{ KEY_REQUEST_PARAMS:postvalue } success:successBlock failure:failureBlock];
}

+(void)requestWithMethods:(NSString *)apiMethods
                withDatas:(NSArray  *)dataArray
                 progress:(PROGRESSCALLBACK)progressCallback
                  success:(SUCCESSCALLBACK)successCallback
                  failure:(FAILURECALLBACK)failureCallback {
    // 1、创建请求操作管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring,网络只有在startMonitoring完成后才可以使用检查网络状态。
    if ( ![self beforeExecute:manager] ) {
        [self alertErrorMessage:NSLocalizedString(@"Check your internet connection, then try it agen", nil)];
        return;
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    if( dataArray == nil )
        manager.requestSerializer.timeoutInterval = 10.0;
    else
        manager.requestSerializer.timeoutInterval = 20.0;
    
    // 2、准备相关请求参数
    NSDictionary *dicSecretJson = [RequestJsonMaker packageSecretJson:apiMethods];
    
    NSString *idvalue   = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS_ID];
    NSString *postvalue = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS];
    
    NSString *baseURL   = nil;
    if (isDebugAPI)
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST_DEBUG, idvalue];
    else
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST, idvalue];

    NSString* strAfterDecodeByUTF8AndURI = [postvalue stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DDLogDebug(@"请求参数\n%@\n%@", baseURL, strAfterDecodeByUTF8AndURI);
    
    void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        DDLogDebug(@"%@", [error localizedDescription]);
        [self afterExecute:error];
        
        if (failureCallback) {
            failureCallback(error);
        }
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject) = ^(AFHTTPRequestOperation *operation, id responseObject)  {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            DDLogDebug(@"请求返回\n%@\n%@", baseURL, operation.responseString);
            if (successCallback) {
                successCallback(responseObject);
            }
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
        else {
            NSError *error = [NSError errorWithDomain:@"com.enjoyneyinc.enjoyney" code:1 userInfo:@{@"error":@"返回数据解析错误"}];
            failureBlock(operation, error);
        }
    };

    AFHTTPRequestOperation *operation = [manager POST:baseURL parameters:@{ KEY_REQUEST_PARAMS:postvalue }
                            constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                if (dataArray && [dataArray count] > 0) {
                                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                    formatter.dateFormat = @"yyyyMMddHHmmss";
                                   
                                    [dataArray enumerateObjectsUsingBlock:^(UIImage *image, NSUInteger idx, BOOL *stop) {
                                        NSString *str       = [formatter stringFromDate:[NSDate date]];
                                        NSString *fileName  = [NSString stringWithFormat:@"%@.jpg", str];
                                        
                                        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.8)
                                                                    name:str
                                                                fileName:fileName
                                                                mimeType:@"image/jpeg"];
                                    }];
                                    
                                }
                            } success:successBlock failure:failureBlock];
    
    if(progressCallback) {
        [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
            progressCallback( totalBytesWritten*1.0/totalBytesExpectedToWrite );
        }];
    }
    
    [operation start];
}

+(id)syncRequestWithMethods:(NSString *)apiMethods error:(NSError *__autoreleasing *)outError {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring,网络只有在startMonitoring完成后才可以使用检查网络状态。
    if ( ![self beforeExecute:manager] ) {
        [self alertErrorMessage:NSLocalizedString(@"Check your internet connection, then try it agen", nil)];
        return nil;
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.requestSerializer.timeoutInterval = 10.0;
    
    // 2、准备相关请求参数
    NSDictionary *dicSecretJson = [RequestJsonMaker packageSecretJson:apiMethods];
    
    NSString *idvalue   = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS_ID];
    NSString *postvalue = [dicSecretJson objectForKey:KEY_REQUEST_PARAMS];
    
    NSString *baseURL   = nil;
    if (isDebugAPI)
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST_DEBUG, idvalue];
    else
        baseURL = [NSString stringWithFormat:@"%@?i=%@", URL_HOST, idvalue];
    
    NSString* strAfterDecodeByUTF8AndURI = [postvalue stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    DDLogDebug(@"请求参数\n%@\n%@", baseURL, strAfterDecodeByUTF8AndURI);
    
    id responseObject = [manager syncPOST:baseURL parameters:@{ KEY_REQUEST_PARAMS:postvalue } operation:NULL error:outError];
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        DDLogDebug(@"请求返回\n%@\n%@", baseURL, responseObject);
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    return responseObject;
}


@end
