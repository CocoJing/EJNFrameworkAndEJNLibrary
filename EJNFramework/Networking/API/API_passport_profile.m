
#import "API_passport_profile.h"


@implementation API_passport_profile

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
	return false;
}


+(NSString*) CMD {
	return @"passport.profile";
}


+(API_passport_profile *) create:(id)view_model user_id:(id)user_id birthday:(id)birthday zipcode:(id)zipcode intro:(id)intro {
	
    API_passport_profile *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id   = user_id;
    model.birthday  = birthday;
    model.zipcode   = zipcode;
    model.intro     = intro;
    
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
    [self.param_table addObject:self.birthday?self.birthday:@""];
    [self.param_table addObject:self.zipcode?self.zipcode:@""];
    [self.param_table addObject:self.intro?self.intro:@""];
    
	return true;
}


@end


