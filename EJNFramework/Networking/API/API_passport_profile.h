

#import "API_Base.h"

////用户信息补充
@interface API_passport_profile : API_Base


@property (nonatomic,strong) id user_id;

@property (nonatomic,strong) id birthday;

@property (nonatomic,strong) id zipcode;

@property (nonatomic,strong) id intro;


/**
 * //用户
 
 * @return
 */
+(API_passport_profile *) create:(id)view_model user_id:(id)user_id birthday:(id)birthday zipcode:(id)zipcode intro:(id)intro;

@end


