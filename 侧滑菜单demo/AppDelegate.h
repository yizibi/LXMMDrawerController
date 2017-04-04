//
//  AppDelegate.h
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LX_TabBarViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/** tabBar控制器 */
@property (nonatomic, strong) LX_TabBarViewController *mainTabBarController;
+ (AppDelegate *)appDelegate;


/**
 *  MMDrawerController属性
 */
@property(nonatomic,strong) MMDrawerController * drawerController;


@end

