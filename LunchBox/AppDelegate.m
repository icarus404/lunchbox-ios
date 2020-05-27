//
//  AppDelegate.m
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedobjectcontext = _managedobjectcontext;
@synthesize managedobjectmodel = _managedobjectmodel;
@synthesize persistentstorecontainer = _persistentstorecontainer;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"Document Path : %@" ,[[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject]);

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"LunchBox"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}


//no objectcontext -> so stored data inside persistencestore (container) via objectcontext (object model)
-(NSManagedObjectContext *) managedobjectcontext
{
    
    if(_managedobjectcontext !=nil)
    {
        
        return _managedobjectcontext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentstorecontainer];  //need to store data here
    
    if(coordinator !=nil)
    {
        _managedobjectcontext = [[NSManagedObjectContext alloc] init];
        [_managedobjectcontext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedobjectcontext;
}


-(NSManagedObjectModel *) managedobjectmodel
{
   if (_managedobjectmodel != nil)
   {
       return _managedobjectmodel;
   }
    
    NSURL *modelurl = [[NSBundle mainBundle]URLForResource:@"LunchBox" withExtension:@"momd"];
    
    _managedobjectmodel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelurl];
    
    return _managedobjectmodel;
}

-(NSURL *)applicationdocumentdirectory
{
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];  //user will check in filemanager-document directory and store data created in above document in last object(index above zero)
    
}


#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
