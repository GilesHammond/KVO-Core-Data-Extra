# KVO-Core-Data-Extra
Showing erroneous extra observation calls when saving a child NSManagedObject context.

Run the project in debug.
From the Main Menu select ADD CHILD multiple times.

Watch the debug output.
Intertion observations are sent correctly on the child NSManagedObjectContext.
Two intertion observations are sent to the main context.

Related SO: https://stackoverflow.com/questions/59327605
