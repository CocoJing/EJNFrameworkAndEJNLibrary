

#import "API_Base.h"

////用户信息补充
@interface API_sporder_accept : API_Base


@property (nonatomic,strong) id sp_user_id;
@property (nonatomic,strong) id order_id;

/**
 * //用户
 
 * @return
 */
+(API_sporder_accept *) create:(id)view_model
                   sp_user_id:(id)sp_user_id order_id:(id)order_id;

@end


