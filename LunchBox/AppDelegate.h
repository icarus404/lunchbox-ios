//
//  AppDelegate.h
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property (readonly, strong, nonatomic)NSManagedObjectContext *managedobjectcontext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedobjectmodel;

@property(readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentstorecontainer;

- (void)saveContext;

-(NSURL *) applicationdocumentdirectory;

@end

