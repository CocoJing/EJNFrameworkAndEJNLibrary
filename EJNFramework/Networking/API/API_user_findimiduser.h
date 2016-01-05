

#import "API_Base.h"

////用户信息补充
@interface API_user_findimiduser : API_Base


@property (nonatomic,strong) id im_id;


/**
 * //用户
 
 * @return
 */
+(API_user_findimiduser *) create:(id)view_model im_id:(id)im_id;

@end


