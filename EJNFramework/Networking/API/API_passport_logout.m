
#import "API_passport_logout.h"


@implementation API_passport_logout

-(BOOL)is_invalid
{
	//用户ID
	if(![API_Base is_object_valid:self.user_id]) {
		return true;
	}
    
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"passport.logout";
}


/**
* //用户退出
* @param user_id		**此属性不能为null**: 用户ID
* @return
*/
+(API_passport_logout *) create:(id)view_model user_id:(id)user_id {
	
    API_passport_logout *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
	//用户ID
	model.user_id = user_id;
    
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

	//用户ID
	[self.param_table addObject:self.user_id?self.user_id:@""];
    
	return true;
}


@end


