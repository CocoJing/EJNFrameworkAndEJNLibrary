
#import "API_userorder_detail.h"


@implementation API_userorder_detail

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}


    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.order_id]) {
        return true;
    }

	return false;
}


+(NSString*) CMD {
	return @"userorder.detail";
}


+(API_userorder_detail *) create:(id)view_model user_id:(id)user_id order_id:(id)order_id {
	
    API_userorder_detail *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id   	= user_id;
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
    
    [self.param_table addObject:self.user_id?self.user_id:@""];
    [self.param_table addObject:self.order_id?self.order_id:@""];
    
	return true;
}


@end


