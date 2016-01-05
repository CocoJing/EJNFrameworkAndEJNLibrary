
#import "API_passport_login.h"


@implementation API_passport_login

-(BOOL)is_invalid
{
	//邮箱
	if(![API_Base is_object_valid:self.email]) {
		return true;
	}
	//密码
	if(![API_Base is_object_valid:self.password]) {
		return true;
	}
    
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"passport.login";
}


/**
* //用户登陆
* @param email		**此属性不能为null**: 邮箱
* @param password   **此属性不能为null**: 密码
* @return
*/
+(API_passport_login *) create:(id) view_model email:(id)email password:(id)password {
	
    API_passport_login *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
	//邮箱
	model.email     = email;
	//密码
	model.password  = password;
    
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

	//邮箱
	[self.param_table addObject:self.email?self.email:@""];
	//密码
	[self.param_table addObject:self.password?self.password:@""];
    
	return true;
}


@end


