

#import "API_Base.h"

////用户信息补充
@interface API_userorder_lists : API_Base


@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id sp_user_id;

@property (nonatomic,strong) id flag;
@property (nonatomic,strong) id date;

@property (nonatomic,strong) id page;

@property (nonatomic,strong) id pagesize;

/**
 * //用户
 
 * @return
 */
+(API_userorder_lists *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id flag:(id)flag date:(id)date
                           page:(id)page pagesize:(id)pagesize;

@end


