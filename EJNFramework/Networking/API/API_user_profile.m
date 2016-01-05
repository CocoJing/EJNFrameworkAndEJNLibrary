
#import "API_user_profile.h"


@implementation API_user_profile

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"user.profile";
}


+(API_user_profile *) create:(id)view_model user_id:(id)user_id {
	
    API_user_profile *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id   = user_id;
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
    
    [self.param_table addObject:self.user_id?self.user_id:@""];
    
	return true;
}


@end


