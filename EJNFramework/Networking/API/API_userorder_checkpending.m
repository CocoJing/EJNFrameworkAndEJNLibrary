
#import "API_userorder_checkpending.h"


@implementation API_userorder_checkpending

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}


    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.sp_user_id]) {
        return true;
    }

	return false;
}


+(NSString*) CMD {
	return @"userorder.checkpending";
}


+(API_userorder_checkpending *) create:(id)view_model user_id:(id)user_id sp_user_id:(id)sp_user_id {
	
    API_userorder_checkpending *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id   	= user_id;
    model.sp_user_id   	= sp_user_id;
    
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
    [self.param_table addObject:self.sp_user_id?self.sp_user_id:@""];
    
	return true;
}


@end



