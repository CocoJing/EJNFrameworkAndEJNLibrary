

#import "API_Base.h"

////用户信息补充
@interface API_sporder_lists : API_Base


@property (nonatomic,strong) id sp_user_id;
@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id flag;
@property (nonatomic,strong) id date;

@property (nonatomic,strong) id page;

@property (nonatomic,strong) id pagesize;

/**
 * //用户
 
 * @return
 */
+(API_sporder_lists *) create:(id)view_model
                   sp_user_id:(id)sp_user_id user_id:(id)user_id flag:(id)flag date:(id)date
                         page:(id)page pagesize:(id)pagesize;

@end


