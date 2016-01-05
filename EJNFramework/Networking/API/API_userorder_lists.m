
#import "API_userorder_lists.h"


@implementation API_userorder_lists

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
    
    if(![API_Base is_object_valid:self.page]) {
        return true;
    }
    if(![API_Base is_object_valid:self.pagesize]) {
        return true;
    }

	return false;
}


+(NSString*) CMD {
	return @"userorder.lists";
}


+(API_userorder_lists *) create:(id)view_model
                        user_id:(id)user_id sp_user_id:(id)sp_user_id flag:(id)flag date:(id)date
                           page:(id)page pagesize:(id)pagesize {
	
    API_userorder_lists *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id   	= user_id;
    model.sp_user_id   	= sp_user_id;
    model.date   		= date;
    model.flag          = flag;
    
    model.page      = page;
    model.pagesize  = pagesize;
    
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
    [self.param_table addObject:self.flag?self.flag:ORDER_DATE_FILTER_IGNORE];
    [self.param_table addObject:self.date?self.date:@""];
    
    [self.param_table addObject:self.page?self.page:@0];
    [self.param_table addObject:self.pagesize?self.pagesize:@10];
    
	return true;
}


@end



