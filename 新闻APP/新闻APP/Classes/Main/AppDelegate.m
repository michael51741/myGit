//
//  AppDelegate.m
//  新闻APP
//
//  Created by tarena on 16/8/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //获取之前保存的版本号
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //创建当前版本号
    NSString *currentVersion = [ud objectForKey:@"version"];
    //获取系统版本号
    NSDictionary *dic = [NSBundle mainBundle].infoDictionary;
    NSString *version = dic[@"CFBundleShortVersionString"];
    //判断保存的和实际的是否相等
    if (![currentVersion isEqualToString:version])
    {//版本发生改变后的第一次运行
        [ud setObject:version forKey:@"version"];
        [ud synchronize];
        //        展示欢迎页面
        //        创建欢迎页面
        
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        self.window.rootViewController = [WelcomeViewController new];
        
        [self.window makeKeyAndVisible];
        
    }
    else
    {
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        self.window.rootViewController = [LoginViewController new];
        
        [self.window makeKeyAndVisible];
    }
    
    
    
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
