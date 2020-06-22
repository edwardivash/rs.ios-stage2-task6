//
//  AppDelegate.m
//  Task6Project
//
//  Created by Эдуард on 6/20/20.
//  Copyright © 2020 Eduard Ivash. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    FirstViewController *firstVC = [[FirstViewController alloc]initWithNibName:@"FirstViewController" bundle:nil];
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:firstVC];

    [self.window makeKeyAndVisible];
    [self.window setRootViewController:nvc];

    return YES;
}




@end
