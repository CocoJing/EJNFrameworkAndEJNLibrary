

#import "API_Base.h"

/*
 生成订单
    userorder.create
    POST

    成功返回订单id
    失败也会把nonce同时返回去
*/
@interface API_userorder_create : API_Base


@property (nonatomic,strong) id user_id;
@property (nonatomic,strong) id sp_user_id;
@property (nonatomic,strong) id service_id;

@property (nonatomic,strong) id date;
@property (nonatomic,strong) id time;

@property (nonatomic,strong) id detail;
@property (nonatomic,strong) id nonce;
@property (nonatomic,strong) id last4;


/**
 * //用户
 用户ID：      user_id
 SPID：      sp_user_id
 服务id：      service_id
 约定日期：      date
 时间：      time
 备注：      detail
 bt-nonce：      nonce
 bt-last4：      last
 * @return
 */
+(API_userorder_create *) create:(id)view_model user_id:(id)user_id sp_user_id:(id) sp_user_id service_id:(id) service_id
						date:(id) date time:(id) time detail:(id) detail
						nonce:(id) nonce last4:(id) last4;

@end


/*
 
 @property (nonatomic,strong) id interest_id;
 
 @property (nonatomic,strong) id service_date;
 
 //@property (nonatomic,strong) id interval_id;
 @property (nonatomic,strong) id service_hour;
 
 
 @property (nonatomic,strong) id amount;
 
 @property (nonatomic,strong) id location;
 
 @property (nonatomic,strong) id location_longitude;
 
 @property (nonatomic,strong) id location_latitude;

*/