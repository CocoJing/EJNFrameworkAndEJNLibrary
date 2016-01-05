//
//  NSString+JSON.m
//  Pods
//
//  Created by nora on 12/28/13.
//
//

#import "NSString+EJNJSON.h"

@implementation NSString (EJNJSON)

- (id) parseAsJSON
{
    NSError *error = nil;

    id obj = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                             options:NSJSONReadingMutableContainers
                                               error:&error];
    if(error) {
        DDLogError(@"Failed to parse as JSON: %@", error);
        return nil;
    }
    
    return obj;
}

@end
