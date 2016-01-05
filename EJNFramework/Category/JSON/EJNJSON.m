//
//  NSArray+JSON.m
//  Pods
//
//  Created by nora on 12/28/13.
//
//

#import "EJNJSON.h"
#import "NSString+EJNJSON.h"

@implementation EJNJSON

+ (id) jsonNamed:(NSString *)resource_name
{
    return [self jsonNamed:resource_name inBundle:[NSBundle mainBundle]];
}

+ (id) jsonNamed:(NSString *)resource_name inBundleForClass:(Class)bundle_class
{
    return [self jsonNamed:resource_name inBundle:[NSBundle bundleForClass:bundle_class]];
}

+ (id) jsonNamed:(NSString *)resource_name inBundle:(NSBundle *)bundle
{
    NSString *filepath = [bundle pathForResource:resource_name ofType:@"json"];
    if(filepath) {
        NSError *error = nil;
        NSString *data = [NSString stringWithContentsOfFile:filepath
                                                   encoding:NSUTF8StringEncoding
                                                      error:&error];
        return [data parseAsJSON];
    }
    
    return nil;
}

@end
