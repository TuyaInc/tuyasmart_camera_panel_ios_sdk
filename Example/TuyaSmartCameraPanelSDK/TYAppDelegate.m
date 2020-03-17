//
//  TYAppDelegate.m
//  TYLoginModule
//
//  Created by huangmf on 04/25/2018.
//  Copyright (c) 2018 huangmf. All rights reserved.
//

#import "TYAppDelegate.h"
#import <TuyaSmartHomeKit/TuyaSmartKit.h>
#import "TuyaSmartDeviceTableViewController.h"
#import "TuyaSmartUserConfig.h"

@implementation TYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    [[TuyaSmartSDK sharedInstance] startWithAppKey:[TuyaSmartUserConfig tyAppKey] secretKey:[TuyaSmartUserConfig tyAppSecret]];
    [[TuyaSmartSDK sharedInstance] setDebugMode:YES];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *vc = [TuyaSmartDeviceTableViewController new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}


@end
