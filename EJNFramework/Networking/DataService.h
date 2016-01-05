//
//  RecipseService.h
//  RecipeSprite
//
//  Created by 傅 强 on 13-11-3.
//
//

#import "EJNNetworkingPreCompile.h"

#import "NetworkManager.h"

@interface DataService : EJNNSObject

+(DataService *)sharedInstance;

-(void)postValueByMethod:(NSArray *)arrayAPIMethods
                 success:(SUCCESSCALLBACK)successCallback
                 failure:(FAILURECALLBACK)failureCallback;

-(void)postValueByMethod:(NSArray *)arrayAPIMethods
               withDatas:(NSArray *)dataArray
                progress:(PROGRESSCALLBACK)progressCallback
                 success:(SUCCESSCALLBACK)successCallback
                 failure:(FAILURECALLBACK)failureCallback;


-(id)syncPostValueByMethod:(NSArray *)arrayAPIMethods
                     error:(NSError *__autoreleasing *)outError;

@end
