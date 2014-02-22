//
//  AppDelegate.h
//  CatalogOn
//
//  Created by eduardo fulgencio on 18/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuTVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *ncMenu;
@property (strong, nonatomic) MenuTVC *menuTVC;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (NSFetchedResultsController *)obtenerClientes;
- (NSFetchedResultsController *)obtenerCargos;

@end
