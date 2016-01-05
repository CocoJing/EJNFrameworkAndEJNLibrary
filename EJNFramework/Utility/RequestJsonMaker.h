//
//  RequestJsonMaker.h
//  RecipeSprite
//
//  Created by meishichina on 11/8/13.
//
//

@interface RequestJsonMaker : NSObject

/**
 *  组拼JSON 各方法拼合
 *
 *  @param json
 *
 *  @return
 */
+(NSString*)packedMethodJson:(NSDictionary*)dicMethods;


/**
 *  组拼JSON 公共参数＋加密方法
 *
 *  @param json API方法json字符串
 *
 *  @return 返回
 1.含公共参数的经Base64编码的JSON 参数字符串
 2.含公共参数的经MD5编码的JSON 校验参数字符串
 */
+(NSDictionary*)packageSecretJson:(NSString*)methodJson;



@end
