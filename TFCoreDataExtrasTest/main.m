#import "TFCoreDataExtras.h"
#import <Foundation/Foundation.h>
#import "TFPerson.h"


int main (int argc, const char * argv[]) {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSManagedObjectContext *moc = [NSManagedObjectContext managedObjectContextFromModelNamed:@"Model" storeName:@"TestStore" type:NSSQLiteStoreType];
	
	[[[TFPerson alloc] initWithName:@"Tomas" country:@"Sweden" insertingIntoManagedObjectContext:moc] autorelease];
	[[[TFPerson alloc] initWithName:@"Pelle" country:@"Sweden" insertingIntoManagedObjectContext:moc] autorelease];
	[[[TFPerson alloc] initWithName:@"Igor" country:@"Russia" insertingIntoManagedObjectContext:moc] autorelease];
	
	NSArray *swedes = [TFPerson objectsInManagedObjectContext:moc sortedBy:@"name" ascending:YES matchingPredicateFormat:@"country = %@", @"Sweden"];
	NSLog(@"All swedes: %@", [swedes valueForKey:@"name"]);

	[pool release];
    return 0;
}