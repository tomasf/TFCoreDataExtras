BSD-licensed.

TFCoreDataExtras simplifies Core Data usage. Most things assume you've created class files from your model. It helps you:

* Set up new managed object contexts (loading the store and model for you). `+managedObjectContextFromModelNamed:storeName:type:` loads a model with the specified name from your Resources and associates it with a store from Application Support.
* Create objects. `-initWithEntity:insertIntoManagedObjectContext:` is now `-initInsertingIntoManagedObjectContext:` – the entity is looked up automatically.
* Find objects. In most cases, you no longer need to create fetch requests. Send `+objectsInManagedObjectContext:sortedBy:ascending:matchingPredicateFormat:` (or one of the related methods) to your `NSManagedObject` subclass.

Example
==

	NSArray *people = [MYPerson objectsInManagedObjectContext:moc sortedBy:@"firstName" ascending:YES matchingPredicateFormat:@"city = %@", @"Boston"];

Without TFCoreDataExtras:

	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:@"Person" inManagedObjectContext:moc]];
	[req setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES]]];
	[req setPredicate:[NSPredicate predicateWithFormat:@"city = %@", @"Boston"]];
	NSArray *people = [moc executeFetchRequest:req error:NULL];