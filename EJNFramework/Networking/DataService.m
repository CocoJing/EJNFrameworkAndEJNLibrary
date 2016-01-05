//
//  RecipseService.m
//  RecipeSprite
//
//  Created by 傅 强 on 13-11-3.
//
//

#import "NSString+EJNKit.h"

#import "RequestJsonMaker.h"

#import "DataService.h"

@interface DataService (private)

@end
@implementation DataService

+(DataService *)sharedInstance {
    
    static DataService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataService alloc] init];
    });
    
    return sharedInstance;
}

// ===================================================================================
#pragma mark 网络请求封装操作

-(void)postValueByMethod:(NSArray *)arrayAPIMethods
                success:(SUCCESSCALLBACK)successCallback
                failure:(FAILURECALLBACK)failureCallback {

    NSAssert(arrayAPIMethods != nil, @"业务方法不能为空!");
    
    NSInteger methodSize = [arrayAPIMethods count];
    NSMutableDictionary *dicMethod = [NSMutableDictionary dictionaryWithCapacity:methodSize];
    
    // 遍历 构建请求接口及参数
    [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
        [dicMethod setObject:[API_Base json_from_model:apiModel] forKey:[apiModel command]];
    }];
    
    NSString *methodsString = [RequestJsonMaker packedMethodJson:dicMethod];
    
    [NetworkManager requestWithMethods:methodsString
                               success:^(NSDictionary *resultDic) {
                                   
                                   NSMutableDictionary *dicAPIs = [NSMutableDictionary dictionaryWithCapacity:[resultDic count]];
                                   
                                   // 遍历 JSON TO Model
                                   [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
                                       id apiResult = nil;
                                       
                                       // 取值
                                       NSDictionary *dicAPIResult = [resultDic objectForKey:apiModel.command];
                                       
                                       if (apiModel.view_model) {
                                           apiResult = [apiModel.view_model objectWithKeyValues:dicAPIResult];
                                       }
                                       else {
                                           apiResult = [[MDL_Base class] objectWithKeyValues:dicAPIResult];
                                       }
                                       
                                       // 重新赋值
                                       [dicAPIs setValue:apiResult forKey:apiModel.command];
                                   }];
                                   
                                   successCallback(dicAPIs);
                               }
                               failure:^(NSError *error) {
                                   failureCallback(error);
                               }
     ];
}


-(void)postValueByMethod:(NSArray *)arrayAPIMethods
               withDatas:(NSArray *)dataArray
                progress:(PROGRESSCALLBACK)progressCallback
                 success:(SUCCESSCALLBACK)successCallback
                 failure:(FAILURECALLBACK)failureCallback {
    NSAssert(arrayAPIMethods != nil, @"业务方法不能为空!");
    
    NSInteger methodSize = [arrayAPIMethods count];
    NSMutableDictionary *dicMethod = [NSMutableDictionary dictionaryWithCapacity:methodSize];
    
    // 遍历 构建请求接口及参数
    [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
        [dicMethod setObject:[API_Base json_from_model:apiModel] forKey:[apiModel command]];
    }];
    
    NSString *methodsString = [RequestJsonMaker packedMethodJson:dicMethod];
    
    [NetworkManager requestWithMethods:methodsString
                             withDatas:dataArray
                              progress:^(double percent) {
                                  if (progressCallback)
                                      progressCallback(percent);
                              }
                               success:^(NSDictionary *resultDic) {
                                   
                                   NSMutableDictionary *dicAPIs = [NSMutableDictionary dictionaryWithCapacity:[resultDic count]];
                                   
                                   // 遍历 JSON TO Model
                                   [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
                                       id apiResult = nil;
                                       
                                       // 取值
                                       NSDictionary *dicAPIResult = [resultDic objectForKey:apiModel.command];
                                       
                                       if (apiModel.view_model) {
                                           apiResult = [apiModel.view_model objectWithKeyValues:dicAPIResult];
                                       }
                                       else {
                                           apiResult = [[MDL_Base class] objectWithKeyValues:dicAPIResult];
                                       }
                                       
                                       // 重新赋值
                                       [dicAPIs setValue:apiResult forKey:apiModel.command];
                                   }];
                                   
                                   successCallback(dicAPIs);
                               }
                               failure:^(NSError *error) {
                                   failureCallback(error);
                               }
     ];

}


-(id)syncPostValueByMethod:(NSArray *)arrayAPIMethods error:(NSError *__autoreleasing *)outError {
    
    NSAssert(arrayAPIMethods != nil, @"业务方法不能为空!");
    
    NSInteger methodSize = [arrayAPIMethods count];
    NSMutableDictionary *dicMethod = [NSMutableDictionary dictionaryWithCapacity:methodSize];
    
    // 遍历 构建请求接口及参数
    [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
        [dicMethod setObject:[API_Base json_from_model:apiModel] forKey:[apiModel command]];
    }];
    
    NSString *methodsString = [RequestJsonMaker packedMethodJson:dicMethod];
    
    // 返回数据处理
    NSDictionary *resultDic = [NetworkManager syncRequestWithMethods:methodsString error:outError];
    if (outError != nil && resultDic) {
        NSMutableDictionary *dicAPIs = [NSMutableDictionary dictionaryWithCapacity:[resultDic count]];
        
        // 遍历 JSON TO Model
        [arrayAPIMethods enumerateObjectsUsingBlock:^(API_Base *apiModel, NSUInteger idx, BOOL *stop) {
            id apiResult = nil;
            
            // 取值
            NSDictionary *dicAPIResult = [resultDic objectForKey:apiModel.command];
            
            if (apiModel.view_model) {
                apiResult = [apiModel.view_model objectWithKeyValues:dicAPIResult];
            }
            else {
                apiResult = [[MDL_Base class] objectWithKeyValues:dicAPIResult];
            }
            
            // 重新赋值
            [dicAPIs setValue:apiResult forKey:apiModel.command];
        }];
        
        return dicAPIs;
    }

    return resultDic;
}

@end
