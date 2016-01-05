
#import "API_user_findimiduser.h"
@implementation API_user_findimiduser

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
    
    if(![API_Base is_object_valid:self.im_id]) {
        return true;
    }
    
	return false;
}


+(NSString*) CMD {
	return @"user.findimiduser";
}


+(API_user_findimiduser *) create:(id)view_model im_id:(id)im_id {
	
    API_user_findimiduser *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.im_id   = im_id;
    
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
    
    [self.param_table addObject:self.im_id?self.im_id:@""];
    
	return true;
}


@end


