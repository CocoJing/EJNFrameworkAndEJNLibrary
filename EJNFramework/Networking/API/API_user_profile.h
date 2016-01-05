

#import "API_Base.h"

////用户信息
@interface API_user_profile : API_Base


@property (nonatomic,strong) id user_id;




/**
 * //用户
 
 * @return
 */
+(API_user_profile *) create:(id)view_model user_id:(id)user_id ;

@end


