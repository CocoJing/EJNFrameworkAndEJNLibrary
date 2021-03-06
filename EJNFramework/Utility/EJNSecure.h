
@interface EJNSecure : EJNNSObject

/******************************************************************************
 函数名称 : + (NSString *)base64StringFromText:(NSString *)text
 函数描述 : 将文本转换为base64格式字符串
 输入参数 : (NSString *)text    文本
 输出参数 : N/A
 返回参数 : (NSString *)    base64格式字符串
 备注信息 :
 ******************************************************************************/
+ (NSString*)base64StringFromText:(NSString *)text;

/******************************************************************************
 函数名称 : + (NSString *)textFromBase64String:(NSString *)base64
 函数描述 : 将base64格式字符串转换为文本
 输入参数 : (NSString *)base64  base64格式字符串
 输出参数 : N/A
 返回参数 : (NSString *)    文本
 备注信息 :
 ******************************************************************************/
+ (NSString*)textFromBase64String:(NSString *)base64;

/******************************************************************************
 函数名称 : +(NSString*)encryptMD5String:(NSString*)text
 函数描述 : 将文本转换为MD5格式字符串
 输入参数 : (NSString *)text    文本
 输出参数 : N/A
 返回参数 : (NSString *)    MD5格式字符串
 备注信息 :
 ******************************************************************************/
+(NSString*)encryptMD5String:(NSString*)text;

@end
