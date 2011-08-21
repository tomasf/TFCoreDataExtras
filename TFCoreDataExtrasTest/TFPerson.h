//
//  TFPerson.h
//  TFCoreDataExtrasTest
//
//  Created by Tomas Franzén on 2011-08-21.
//  Copyright (c) 2011 Lighthead Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TFPerson : NSManagedObject
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * country;

- (id)initWithName:(NSString*)name country:(NSString*)country insertingIntoManagedObjectContext:(NSManagedObjectContext*)moc;
@end
