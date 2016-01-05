
#import "API_Base.h"

////用户注册
@interface API_passport_register : API_Base

//邮箱
@property (nonatomic,strong) id email;
//密码
@property (nonatomic,strong) id password;
//姓
@property (nonatomic,strong) id firstname;
//名
@property (nonatomic,strong) id lastname;


/**
 * //用户登陆
 * @param email		**此属性不能为null**: 邮箱
 * @param password  **此属性不能为null**: 密码
 * @param firstname	**此属性不能为null**: 姓
 * @param lastname  **此属性不能为null**: 名
 * @return
 */
+(API_passport_register *) create:(id)view_model email:(id)email password:(id)password firstname:(id)firstname lastname:(id)lastname;

@end


