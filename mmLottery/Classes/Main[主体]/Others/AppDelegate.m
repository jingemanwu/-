//
//  AppDelegate.m
//  mmLottery
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "AppDelegate.h"
#import "MMTabBarController.h"
#import "MMGuideController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


#pragma mark - 新特性逻辑优化
- (BOOL)isNewVersion {

    // 2.1获取应用当前的版本号 -> 获取info.plist所有数据, -> 取出版本号
    NSDictionary *info = [NSBundle mainBundle].infoDictionary;
    
    NSString *currentVersion = info[@"CFBundleShortVersionString"];
    
    // 2.2获取之前存储的版本号
    // - 获取用户偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // - 获取之前的版本号
    NSString *oldVersion = [defaults objectForKey:@"app_version"];
    
    // 2.3 比较
    // - 两个字符串相同,进入主程序
    if ([currentVersion isEqualToString:oldVersion]) {
        
        return YES;
        
    } else {
        
        // 存储
        [defaults setObject:currentVersion forKey:@"app_version"];
        
        // 同步
        [defaults synchronize];
        
        // 返回
        return YES;
    }


}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // MARK: - 1.加载标签控制器
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置根控制器
    if ([self isNewVersion]) {
        // 新特性
        self.window.rootViewController = [[MMGuideController alloc] init];
        
    } else {
        // 主程序
        self.window.rootViewController = [[MMTabBarController alloc] init];
    }
    
    // 4.把窗口设置为主窗口并可见
    [self.window makeKeyAndVisible];
    
    
    // MARK: - 2.状态栏的设置
    // 1.显示白色效果
    application.statusBarStyle = UIStatusBarStyleLightContent;
    // 2.不要隐藏
    application.statusBarHidden = NO;
    
    return YES;
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
