//
//  NCCWLLogger.h
//
//  Created by nickcheng on 13-3-18.
//  Copyright (c) 2013年 NC. All rights reserved.
//

#import "DDLog.h"

@interface EJNBonjourLogger : DDAbstractLogger <DDLogger>

+ (EJNBonjourLogger *)sharedInstance;

@end
