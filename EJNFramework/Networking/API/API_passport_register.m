
#import "API_passport_register.h"


@implementation API_passport_register

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
    //姓
    if(![API_Base is_object_valid:self.firstname]) {
        return true;
    }
    //名
    if(![API_Base is_object_valid:self.lastname]) {
        return true;
    }
    
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"passport.register";
}


+(API_passport_register *) create:(id)view_model email:(id)email password:(id)password firstname:(id)firstname lastname:(id)lastname {
	
    API_passport_register *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
	//手机号
	model.email = email;
	//密码
    model.password  = password;
    //姓
    model.firstname = firstname;
    //名
    model.lastname = lastname;
    
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
    //姓
    [self.param_table addObject:self.firstname?self.firstname:@""];
    //名
    [self.param_table addObject:self.lastname?self.lastname:@""];
    
	return true;
}


@end


