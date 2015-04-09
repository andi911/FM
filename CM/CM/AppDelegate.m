//
//  AppDelegate.m
//  CM
//
//  Created by liangyu on 15-4-3.
//  Copyright (c) 2015年 cheng. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageViewController.h"
#import "LinkmanViewController.h"
#import "DynamicViewController.h"
#import "CMnavViewController.h"
#import "CMtabViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //message
    MessageViewController *messageController = [[MessageViewController alloc]init];
    messageController.title = NSLocalizedString(@"Message", nil);
    messageController.tabBarItem.image = [UIImage imageNamed:@"消息.png"];
    CMnavViewController *messageNavigationController = [[CMnavViewController alloc]initWithRootViewController:messageController];
    
    //Linkman
    LinkmanViewController *linkmanController = [[LinkmanViewController alloc]init];
    linkmanController.title = NSLocalizedString(@"Linkman", nil);
    linkmanController.tabBarItem.image = [UIImage imageNamed:@"联系人.png"];
    CMnavViewController *linkmanNavigationController = [[CMnavViewController alloc]initWithRootViewController:linkmanController];
    
    //Dynamic
    DynamicViewController *dynamicController = [[DynamicViewController alloc]init];
    dynamicController.title = NSLocalizedString(@"Dynamic", nil);
    dynamicController.tabBarItem.image = [UIImage imageNamed:@"动态.png"];
    CMnavViewController *dynamicNavigationController = [[CMnavViewController alloc]initWithRootViewController:dynamicController];
    
    //tabBarController
    CMtabViewController * tabBarController = [[CMtabViewController alloc]init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:messageNavigationController,linkmanNavigationController,dynamicNavigationController, nil];
    
    //set UI Image
    if (CURRENT_SYS_VERSION >= 7.0) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:27/255.0f green:166/255.0f blue:225/255.0f alpha:1]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    } else {
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:27/255.0f green:166/255.0f blue:225/255.0f alpha:1]];
    }
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:17], NSFontAttributeName, nil]];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
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
