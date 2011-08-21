//
//  TFPerson.m
//  TFCoreDataExtrasTest
//
//  Created by Tomas Franzén on 2011-08-21.
//  Copyright (c) 2011 Lighthead Software. All rights reserved.
//

#import "TFPerson.h"
#import "TFCoreDataExtras.h"

@implementation TFPerson
@dynamic name;
@dynamic country;


- (id)initWithName:(NSString*)name country:(NSString*)country insertingIntoManagedObjectContext:(NSManagedObjectContext*)moc {
	if(!(self = [super initInsertingIntoManagedObjectContext:moc])) return nil;
	
	self.name = name;
	self.country = country;
	
	return self;
}


@end