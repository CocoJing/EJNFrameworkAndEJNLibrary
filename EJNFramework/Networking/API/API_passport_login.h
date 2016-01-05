
#import "API_Base.h"

////用户登陆
@interface API_passport_login : API_Base

//邮箱
@property (nonatomic,strong) id email;
//密码
@property (nonatomic,strong) id password;


/**
* //用户登陆
* @param email		**此属性不能为null**: 邮箱
* @param password		**此属性不能为null**: 密码
* @return
*/
+(API_passport_login *) create:(id)view_model email:(id)email password:(id)password;

@end


