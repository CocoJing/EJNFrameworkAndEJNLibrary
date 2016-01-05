//
//  ETY_Service.m
//  Enjoyney
//
//  Created by 傅强 on 15/11/13.
//  Copyright © 2015年 enjoyney. All rights reserved.
//

#import "ETY_Service.h"

@implementation ETY_Service

-(CLLocationCoordinate2D)coordinate {
    
    CLLocationCoordinate2D result;
    
    result.latitude     = [self.lbs_latitude doubleValue];
    result.longitude    = [self.lbs_longitude doubleValue];
    
    return result;
}

@end