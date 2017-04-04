//
//  AppDelegate.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "LX_TabBarViewController.h"
#import "LX_NavgationViewController.h"
#import "leftViewController.h"
#import "MMExampleDrawerVisualStateManager.h"

#define leftSideBarWidth  375.0f // 左侧侧边栏视图宽度(左侧侧边栏宽度默认为260.f)
static AppDelegate *_appDelegate = nil;


@interface AppDelegate ()



@end

@implementation AppDelegate
+ (AppDelegate *)appDelegate {
    return _appDelegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _appDelegate = self;

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = self.drawerController;
    [self.window makeKeyAndVisible];
    
    return YES;
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
    
    LXLogFunc;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    LXLogFunc;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (MMDrawerController *)drawerController{
    if (!_drawerController) {
        leftViewController *leftVc = [[leftViewController alloc] init];
        LX_NavgationViewController *leftNavVc = [[LX_NavgationViewController alloc] initWithRootViewController:leftVc];
        
        LX_NavgationViewController *centerNavVc = [[LX_NavgationViewController alloc] initWithRootViewController:self.mainTabBarController];
        centerNavVc.navigationBar.hidden = YES;
        _drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerNavVc leftDrawerViewController:leftNavVc rightDrawerViewController:nil];
        _drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        
        _drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
        _drawerController.maximumLeftDrawerWidth = leftSideBarWidth;
        
        _drawerController.showsShadow = NO;
        
        [_drawerController
         setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
             MMDrawerControllerDrawerVisualStateBlock block;
             block = [[MMExampleDrawerVisualStateManager sharedManager]
                      drawerVisualStateBlockForDrawerSide:drawerSide];
             if(block){
                 block(drawerController, drawerSide, percentVisible);
             }
         }];
    }
    return _drawerController;
}


- (LX_TabBarViewController *)mainTabBarController{
    if (!_mainTabBarController) {
        _mainTabBarController = [[LX_TabBarViewController alloc] init];
    }
    return _mainTabBarController;
}
@end
