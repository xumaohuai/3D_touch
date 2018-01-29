//
//  AppDelegate.m
//  3D_Touch
//
//  Created by 徐茂怀 on 16/2/14.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SearchView.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"hello github");
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    _window.rootViewController = nav;
    [_window makeKeyAndVisible];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"搜索" localizedTitle:@"搜索"];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"第二页" localizedTitle:@"第二页"];
    NSArray *shortItems = @[item1,item2];
    [[UIApplication sharedApplication]setShortcutItems:shortItems];
    
    return YES;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if ([shortcutItem.localizedTitle isEqual:@"搜索"]) {
        ViewController *vc = [[ViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        _window.rootViewController = nav;
        [_window makeKeyAndVisible];
        SearchView *sv = [[SearchView alloc]init];
        [sv.searchBar becomeFirstResponder];
        [nav pushViewController:sv animated:YES];
    }
    else if([shortcutItem.localizedTitle isEqual:@"第二页"])
    {
        ViewController *vc = [[ViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        _window.rootViewController = nav;
        [_window makeKeyAndVisible];
        SecondViewController *sv = [[SecondViewController alloc]init];
        [nav pushViewController:sv animated:YES];
    }

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
