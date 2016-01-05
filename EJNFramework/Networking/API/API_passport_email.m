
#import "API_passport_email.h"


@implementation API_passport_email

-(BOOL)is_invalid
{
    if(![API_Base is_object_valid:self.command]) {
        return true;
    }
    
    // 邮箱
	if(![API_Base is_object_valid:self.email]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"passport.email";
}


+(API_passport_email *) create:(id)view_model email:(id)email {
    
    API_passport_email *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
	// 邮箱
	model.email = email;
    
	if( ![model build] ) {
		return nil;
	}
    
	return model;
}


-(BOOL)build
{
	if( [self is_invalid] ) {
		return false;
	}

	self.param_table = [[NSMutableArray alloc] init];
	if( !self.param_table ) {
		return false;
	}
    
    // 邮箱
	[self.param_table addObject:self.email?self.email:@""];
    
	return true;
}

@end


