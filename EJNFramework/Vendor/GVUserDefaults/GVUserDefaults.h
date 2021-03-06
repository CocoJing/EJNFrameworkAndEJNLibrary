//
//  GVUserDefaults.h
//  GVUserDefaults
//
//  Created by Kevin Renskers on 18-12-12.
//  Copyright (c) 2012 Gangverk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataService.h"

@interface GVUserDefaults : NSObject

+ (instancetype)standardUserDefaults;
+ (void)saveUserInfo:(ETY_Provider *)provider;

@end
