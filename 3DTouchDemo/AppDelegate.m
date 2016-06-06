//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by xmc on 16/1/30.
//  Copyright © 2016年 parkycloud. All rights reserved.
//


#define kSearchType  @"com.parkycloud.app.search"
#define kCollectType  @"com.parkycloud.app.love"
#define kEditType  @"com.parkycloud.app.edit"


#import "AppDelegate.h"

#import "DetailViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self createShortcutItem];
    
    return YES;
}


- (void)createShortcutItem
{
    UIApplicationShortcutIcon *searchIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];

    
    UIApplicationShortcutItem *searchItem = [[UIApplicationShortcutItem alloc] initWithType:kSearchType localizedTitle:@"搜索" localizedSubtitle:nil icon:searchIcon userInfo:nil];
    
    UIApplicationShortcutIcon *loveIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove];
    
    
    UIApplicationShortcutItem *loveItem = [[UIApplicationShortcutItem alloc] initWithType:kCollectType localizedTitle:@"收藏" localizedSubtitle:nil icon:loveIcon userInfo:nil];
    
    UIApplicationShortcutIcon *editIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon_edit"];
    
    
    UIApplicationShortcutItem *editItem = [[UIApplicationShortcutItem alloc] initWithType:kEditType localizedTitle:@"编辑" localizedSubtitle:nil icon:editIcon userInfo:nil];
    
   //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[searchItem,loveItem,editItem];

}

//点击屏幕主页弹窗的选项,会触发该AppDelegate代理方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
     NSString *shortcutItemType = shortcutItem.type;
    
    if ([shortcutItemType isEqualToString:kSearchType])
    {
        completionHandler(YES);
    }
    else if ([shortcutItemType isEqualToString:kCollectType])
    {
    
       completionHandler(YES);
    }
    else if ([shortcutItemType isEqualToString:kEditType])
    {
        AppDelegate *app = application.delegate;
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:detailVC];
        
        [app.window.rootViewController presentViewController:navi animated:YES completion:nil];
        completionHandler(YES);
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
