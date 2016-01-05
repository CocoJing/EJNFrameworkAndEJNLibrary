//
//  CrashlyticsLogger.h
//
//  Created by Simons, Mike on 5/16/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import "DDLog.h"

@interface EJNJabberLogger : DDAbstractLogger<DDLogger>

+(EJNJabberLogger*) sharedInstance;

@end
