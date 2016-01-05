//
//  ETY_Service.h
//  Enjoyney
//
//  Created by 傅强 on 15/11/13.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ETY_Provider.h"

@interface ETY_Service : EJNNSObject<MKAnnotation>

@property (nonatomic,copy) NSString *service_id;
@property (nonatomic,copy) NSString *user_id;
@property (nonatomic,copy) NSString *service_category;
@property (nonatomic,copy) NSString *service_title;
@property (nonatomic,copy) NSString *service_cover;
@property (nonatomic,copy) NSString *service_address;
@property (nonatomic,copy) NSString *service_city;
@property (nonatomic,copy) NSString *service_zipcode;
@property (nonatomic,copy) NSString *service_state;
@property (nonatomic,copy) NSString *lbs_longitude;
@property (nonatomic,copy) NSString *lbs_latitude;
@property (nonatomic,copy) NSString *service_period;
@property (nonatomic,copy) NSString *service_interval;
@property (nonatomic,copy) NSString *service_price;
@property (nonatomic,copy) NSString *service_pricedetail;
@property (nonatomic,copy) NSString *service_desc;
@property (nonatomic,copy) NSString *service_flag;
@property (nonatomic,copy) NSString *add_date;
@property (nonatomic,copy) NSString *add_time;

@property (nonatomic,strong) NSArray *service_photos;

@property (nonatomic,strong) ETY_Provider *sp_profile;

/*
 [service_id] => 3
 [user_id] => 29
 [service_category] => professional
 [service_title] => test612
 [service_cover] =>
 [service_photos] =>
 [service_address] => address
 [lbs_longitude] => 0.000000
 [lbs_latitude] => 0.000000
 [service_period] => 30
 [service_interval] => 4
 [service_price] => 45.00
 [service_pricedetail] =>
 [service_desc] =>
 [service_flag] => 1
 [add_date] => 2015-11-12
 [add_time] => 1447330553
 */

@end
