//
//  AppDelegate.m
//  Live
//
//  Created by Never on 2018/3/23.
//  Copyright © 20/Users/y/Desktop/Live/Live/src/Help18年 Never. All rights reserved.
//

#import "AppDelegate.h"
#import "MTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MTabBarController *tabBar = [[MTabBarController alloc] init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {

}


@end
