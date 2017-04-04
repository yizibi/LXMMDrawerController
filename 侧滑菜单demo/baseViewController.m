

//
//  baseViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "baseViewController.h"
#import "AppDelegate.h"
#import "leftViewController.h"
#import "LX_NavgationViewController.h"

@interface baseViewController ()
@property (nonatomic, copy) LeftBarButtonActionBlock leftBarButtonAction;

@end

@implementation baseViewController


// 即将进来页面后关闭抽屉
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self enableOpenCenterDrawer:NO];
}

// 即将出去后再打开 因为可能其他页面需要抽屉效果
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self enableOpenCenterDrawer:YES];
}


- (void)pushNewViewController:(UIViewController *)newViewController {
    [self.navigationController pushViewController:newViewController animated:YES];
}
- (void)configureLeftBarButtonWithTitle:(NSString *)title action:(LeftBarButtonActionBlock)action {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 40, 30);
    [leftBtn addTarget:self action:@selector(clickedLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitle:title forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *navLeftBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem =navLeftBtn;
    
    self.leftBarButtonAction = action;
    
}
- (void)clickedLeftBarButtonItemAction
{
    if (self.leftBarButtonAction) {
        self.leftBarButtonAction();
    }
}

- (void)enableOpenCenterDrawer:(BOOL)enable{
    if (enable == YES) {
        // 能够打开
//        LX_NavgationViewController *leftNav = [[LX_NavgationViewController alloc] initWithRootViewController:[[leftViewController alloc] init]];
        
        ShareApp.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    } else {
        // 不能打开抽屉
        ShareApp.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeNone;
    }

}

- (void)enableOpenLeftDrawer:(BOOL)enable
{
    if (enable == YES) {
        // 能够打开
        LX_NavgationViewController *leftNav = [[LX_NavgationViewController alloc] initWithRootViewController:[[leftViewController alloc] init]];
        [ShareApp.drawerController setLeftDrawerViewController:leftNav];
             ShareApp.drawerController.closeDrawerGestureModeMask =MMCloseDrawerGestureModeAll;
    } else {
        // 不能打开抽屉
        
        ShareApp.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeNone;
        [ShareApp.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            [ShareApp.drawerController setLeftDrawerViewController:nil];
        }];
    }
}

- (void)enableOpenRightDrawer:(BOOL)enable
{
    if (enable == YES) {
        // 能够打开
//                UINavigationController *RightNav = [[UINavigationController alloc] initWithRootViewController:[[RightViewController alloc] init]];
//        RightViewController *rightVC = [[RightViewController alloc] init];
//        [ShareApp.drawerController setRightDrawerViewController:rightVC];
    } else {
        // 不能打开抽屉
        [ShareApp.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            [ShareApp.drawerController setRightDrawerViewController:nil];
        }];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
