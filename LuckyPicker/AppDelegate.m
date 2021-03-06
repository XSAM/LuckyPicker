//
//  AppDelegate.m
//  LuckyPicker
//
//  Created by BangshengXie on 12/04/2017.
//  Copyright © 2017 BangshengXie. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "RandomListContent+CoreDataClass.h"
#import "RandomListItem+CoreDataClass.h"
#import "NSString+Hex.h"
#import "UIColor+Hex.h"
#import "RandomListDatabase.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSNumber *number = [defaults objectForKey:@"isFirstRun"];
    if(number)
    {
        NSLog(@"%@", number);
        NSLog(@"Second Run");
    }
    else
    {
        NSLog(@"First Run");
        [defaults setObject:[NSNumber numberWithInteger:0] forKey:@"isFirstRun"];
        [self setupCoreData];
    }
    [defaults synchronize];

    
//    //insert
//    RandomListContent *title = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListContent"
//                                                           inManagedObjectContext:context];
//    title.title = @"Do it?";
//    RandomListItem *item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
//                                                               inManagedObjectContext:context];
//    item.title = title;
//    item.name = @"DoIt";
//    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
//                                                         inManagedObjectContext:context];
//    item.title = title;
//    item.name = @"Nope";
//    
//    [context save:&error];
//    if(error)
//    {
//        NSLog(@"%@",error);
//    }
    
//    //query
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"RandomListContent"];
//    NSSortDescriptor *dataSort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
//    request.sortDescriptors = @[dataSort];
//    
//    NSArray *allContent = [context executeFetchRequest:request
//                                                 error:&error];
//    if(error)
//    {
//        NSLog(@"%@",error);
//    }
//    for(RandomListContent *title in allContent)
//    {
//        NSLog(@"%@", title.title);
//        for(RandomListItem *item in title.items)
//        {
//            NSLog(@"%@", item.name);
//        }
//    }
    
    return YES;
}

- (void)setupCoreData
{
    RandomListDatabase *randomListDatabase = [[RandomListDatabase alloc] init];
    
    [self createDataWithManagedObjectContext:randomListDatabase.context];
}

- (void)createDataWithManagedObjectContext:(NSManagedObjectContext*)context
{
    RandomListContent *title;
    RandomListItem *item;
    
    //insert dinnerTitle
    title = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListContent"
                                          inManagedObjectContext:context];
    title.title = NSLocalizedString(@"dinnerTitle", nil);
    
    //insert dinnerItem
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem1", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem2", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem3", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem4", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem5", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem6", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"dinnerItem7", nil);
    

    //insert yesnoTitle
    title = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListContent"
                                          inManagedObjectContext:context];
    title.title = NSLocalizedString(@"yesnoTitle", nil);
    
    //insert yesnoItem
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"yesnoItem1", nil);
    
    item = [NSEntityDescription insertNewObjectForEntityForName:@"RandomListItem"
                                         inManagedObjectContext:context];
    item.title = title;
    item.name = NSLocalizedString(@"yesnoItem2", nil);
    
    NSError *error = nil;
    [context save:&error];
    if(error)
    {
        NSLog(@"%@",error);
    }
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
}


@end
