
#import "API_user_updateprofile.h"
@implementation API_user_updateprofile

-(BOOL)is_invalid
{
	if(![API_Base is_object_valid:self.command]) {
		return true;
	}
    
    if(![API_Base is_object_valid:self.user_id]) {
        return true;
    }
    if(![API_Base is_object_valid:self.firstname]) {
        return true;
    }
    if(![API_Base is_object_valid:self.lastname]) {
        return true;
    }
    if(![API_Base is_object_valid:self.gender]) {
        return true;
    }
    if(![API_Base is_object_valid:self.birthdate]) {
        return true;
    }
    if(![API_Base is_object_valid:self.phone]) {
        return true;
    }
    if(![API_Base is_object_valid:self.location]) {
        return true;
    }
    if(![API_Base is_object_valid:self.activities]) {
        return true;
    }
    if(![API_Base is_object_valid:self.about]) {
        return true;
    }
    
	return false;
}


+(NSString*) CMD {
	return @"user.updateprofile";
}


+(API_user_updateprofile *) create:(id)view_model
                           user_id:(id)user_id    firstname:(id)firstname lastname:(id)lastname gender:(id)gender
                         birthdate:(id)birthdate  phone:(id)phone         location:(id)location activities:(id)activities
                             about:(id)about {
	
    API_user_updateprofile *model = [[self alloc] init];
	if( !model ) {
		return nil;
	}
    
	model.view_model    = view_model;
	model.command       = [self CMD];
    
    model.user_id       = user_id;
    model.firstname     = firstname;
    model.lastname      = lastname;
    model.gender        = gender;
    model.birthdate     = birthdate;
    model.phone         = phone;
    model.location      = location;
    model.activities    = activities;
    model.about         = about;
    
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
    [self.param_table addObject:self.firstname?self.firstname:@""];
    [self.param_table addObject:self.lastname?self.lastname:@""];
    [self.param_table addObject:self.gender?self.gender:@""];
    [self.param_table addObject:self.birthdate?self.birthdate:@""];
    [self.param_table addObject:self.phone?self.phone:@""];
    [self.param_table addObject:self.location?self.location:@""];
    [self.param_table addObject:self.activities?self.activities:@""];
    [self.param_table addObject:self.about?self.about:@""];
    
	return true;
}


@end


