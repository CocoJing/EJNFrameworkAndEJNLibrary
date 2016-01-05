

#import "API_Base.h"

////用户信息补充
@interface API_userorder_detail : API_Base


@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id order_id;



/**
 * //用户
 
 * @return
 */
+(API_userorder_detail *) create:(id)view_model user_id:(id)user_id order_id:(id)order_id ;

@end


