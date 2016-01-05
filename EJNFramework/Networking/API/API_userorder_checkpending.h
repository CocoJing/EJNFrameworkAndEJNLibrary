

#import "API_Base.h"

////用户信息补充
@interface API_userorder_checkpending : API_Base


@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id sp_user_id;



/**
 * //用户
 
 * @return
 */
+(API_userorder_checkpending *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id;

@end


