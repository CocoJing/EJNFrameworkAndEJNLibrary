

#import "API_Base.h"

////用户退出
@interface API_passport_logout : API_Base

//用户ID
@property (nonatomic,strong) id user_id;


/**
* //用户退出
* @param user_id		**此属性不能为null**: 手机号
* @return
*/
+(API_passport_logout *) create:(id)view_model user_id:(id)user_id;

@end


