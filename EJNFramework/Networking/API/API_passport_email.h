
#import "API_Base.h"

////检测邮箱
@interface API_passport_email : API_Base

//邮箱
@property (nonatomic,strong) id email;


/**
* //检测邮箱
* @param email  **此属性不能为null**: email
* @return
*/
+(API_passport_email *) create:(id)view_model email:(id)email;

@end


