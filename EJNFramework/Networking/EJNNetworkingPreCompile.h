//
//  EJNNetworkingPreCompile
//
//  Created by Enjoyney on 14-10-13.
//  Copyright (c) 2015年 enjoyney. All rights reserved.
//

#ifndef EJNNetworkingPreCompile_pch
#define EJNNetworkingPreCompile_pch

#import <MJExtension.h>

// API
#import "API_Base.h"

#import "API_activity_accept.h"
#import "API_activity_cancel.h"
#import "API_activity_connections.h"
#import "API_activity_create.h"
#import "API_activity_decline.h"
#import "API_activity_detail.h"
#import "API_activity_invited.h"
#import "API_activity_mine.h"
#import "API_activity_update.h"
#import "API_activity_invited.h"
#import "API_activity_join.h"
#import "API_activity_remove.h"
#import "API_activity_profile.h"

#import "API_baseconfig_interest.h"

#import "API_payment_braintreetoken.h"
#import "API_payment_braintreesubmit.h"
#import "API_payment_braintreecancel.h"
#import "API_payment_braintreenonce.h"
#import "API_payment_braintreefind.h"
#import "API_payment_braintreeupdate.h"
#import "API_payment_braintreefindbytoken.h"
#import "API_payment_braintreedelete.h"
#import "API_payment_braintreebind.h"
#import "API_payment_braintreeall.h"

#import "API_authorize_facebook.h"
#import "API_authorize_facebookcreate.h"

#import "API_authorize_google.h"
#import "API_authorize_googlecreate.h"

#import "API_authorize_linkedin.h"
#import "API_authorize_linkedincreate.h"

#import "API_provider_main.h"
#import "API_provider_detail.h"
#import "API_provider_push.h"
#import "API_provider_aggregation.h"

#import "API_passport_email.h"
#import "API_passport_login.h"
#import "API_passport_logout.h"
#import "API_passport_register.h"
#import "API_passport_profile.h"

#import "API_relation_add.h"
#import "API_relation_apply.h"
#import "API_relation_applylst.h"
#import "API_relation_accept.h"
#import "API_relation_decline.h"
#import "API_relation_friendlst.h"
#import "API_relation_friendremove.h"
#import "API_relation_platformunlinked.h"
#import "API_relation_invite.h"

#import "API_service_calendar.h"
#import "API_service_detail.h"
#import "API_service_hour.h"
#import "API_service_create.h"
#import "API_service_offline.h"
#import "API_service_online.h"
#import "API_service_mine.h"
#import "API_service_main.h"
#import "API_service_update.h"
#import "API_service_profile.h"

#import "API_user_addfav.h"
#import "API_user_unfav.h"
#import "API_user_favlst.h"
#import "API_user_profile.h"
#import "API_user_bindimid.h"
#import "API_user_findimiduser.h"
#import "API_user_interest.h"
#import "API_user_updatephotointro.h"
#import "API_user_updateprofile.h"
#import "API_user_uploadimage.h"
#import "API_user_storeimage.h"
#import "API_user_sendmail.h"

#import "API_sp_apply.h"
#import "API_sp_applyflag.h"
#import "API_sp_applystatus.h"
#import "API_sp_forbiddates.h"
#import "API_sp_forbiddateopt.h"

// 订单
#import "API_userorder_checkpending.h"  // 检测订单
#import "API_userorder_create.h"        // 生成订单
#import "API_userorder_lists.h"         // 订单列表
#import "API_userorder_detail.h"        // 查看订单
#import "API_userorder_cancel.h"        // 取消订单
#import "API_userorder_star.h"
#import "API_userorder_starlst.h"
// SP订单
#import "API_sporder_lists.h"           // SP订单列表
#import "API_sporder_decline.h"         // SP拒绝订单
#import "API_sporder_accept.h"          // SP确认订单
#import "API_sporder_star.h"
#import "API_sporder_starlst.h"
#import "API_sporder_detail.h"



// Model
#import "MDL_Base.h"

#import "MDL_order_list.h"
#import "MDL_provider_list.h"
#import "MDL_config_interest.h"
#import "MDL_provider_list.h"
#import "MDL_service_list.h"
#import "MDL_activity_list.h"



// Entity
#import "ETY_User.h"
#import "ETY_Order.h"
#import "ETY_Provider.h"
#import "ETY_ConfigInterest.h"
#import "ETY_Star_Comment.h"
#import "ETY_Activity.h"



#endif
