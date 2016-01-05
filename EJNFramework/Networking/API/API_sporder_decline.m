
#import "API_sporder_decline.h"


@implementation API_sporder_decline

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}

    
    if(![API_Base is_object_valid:self.sp_user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.order_id]) {
        return true;
    }
    
	return false;
}


+(NSString*) CMD {
	return @"sporder.decling";
}


+(API_sporder_decline *) create:(id)view_model
                   sp_user_id:(id)sp_user_id order_id:(id)order_id {
	
    API_sporder_decline *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.sp_user_id   	= sp_user_id;
    model.order_id   	= order_id;
    
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
    
    [self.param_table addObject:self.sp_user_id?self.sp_user_id:@""];
    [self.param_table addObject:self.order_id?self.order_id:@""];
    
	return true;
}


@end



