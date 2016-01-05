
#import "API_userorder_create.h"


@implementation API_userorder_create

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
	if(![API_Base is_object_valid:self.service_id]) {
		return true;
	}
    /*
	if(![API_Base is_object_valid:self.date]) {
		return true;
	}	
	if(![API_Base is_object_valid:self.time]) {
		return true;
	}
    if(![API_Base is_object_valid:self.last4]) {
        return true;
    }
    */
	return false;
}


+(NSString*) CMD {
	return @"userorder.create";
}

+(API_userorder_create *) create:(id)view_model user_id:(id)user_id sp_user_id:(id) sp_user_id service_id:(id) service_id
                            date:(id) date time:(id) time detail:(id) detail
                           nonce:(id) nonce last4:(id) last4 {
	
    API_userorder_create *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id       = user_id;
    model.sp_user_id    = sp_user_id;
    model.service_id    = service_id;
    model.date  		= date;
    model.time          = time;
    model.detail        = detail;
    model.nonce         = nonce;
    model.last4         = last4;

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
    [self.param_table addObject:self.service_id?self.service_id:@""];
    [self.param_table addObject:self.date?self.date:@""];
    [self.param_table addObject:self.time?self.time:@""];
    [self.param_table addObject:self.detail?self.detail:@""];
    [self.param_table addObject:self.nonce?self.nonce:@""];
    [self.param_table addObject:self.last4?self.last4:@""];

	return true;
}


@end


