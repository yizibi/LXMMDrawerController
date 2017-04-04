//
//  baseViewController.h
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LeftBarButtonActionBlock) (void);

@interface baseViewController : UIViewController



/**
 *  控制抽屉可否打开左侧页面
 *
 *  @param enable YES 打开抽屉  NO 关闭抽屉
 */
- (void)enableOpenCenterDrawer:(BOOL)enable;
/**
 *  控制抽屉可否打开左侧页面
 *
 *  @param enable YES 打开抽屉  NO 关闭抽屉
 */
- (void)enableOpenLeftDrawer:(BOOL)enable;

/**
 *  控制抽屉可否打开右侧页面
 *
 *  @param enable YES 打开抽屉  NO 关闭抽屉
 */
- (void)enableOpenRightDrawer:(BOOL)enable;

/**
 *  设置带文字的左导航按钮并且回调方法
 *
 *  @param title 设置左侧导航按钮的文字内容
 *  @param action 设置动作
 */
- (void)configureLeftBarButtonWithTitle:(NSString *)title action:(LeftBarButtonActionBlock)action;

/**
 *  push新的控制器到导航控制器
 *
 *  @param newViewController 目标新的视图控制器
 */
- (void)pushNewViewController:(UIViewController *)newViewController;
@end
