

//
//  LX_NavgationViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "LX_NavgationViewController.h"
#import "AppDelegate.h"
#import "leftViewController.h"


@interface LX_NavgationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation LX_NavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;

}


/**
 *  重写push方法
 */

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        
        // 左上角
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"navgationBarBackBlack"] forState:UIControlStateHighlighted];
        /*
         //取消返回
         [backButton setTitle:@"返回" forState:UIControlStateNormal];
         [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
         */
        
        [backButton sizeToFit];
        // 这句代码放在sizeToFit后面
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    [super pushViewController:viewController animated:animated];
}



- (void)back
{
    [self popViewControllerAnimated:YES];
    
//    if (self.childViewControllers.count) {
//        if (self.childViewControllers.count == 2) {
//            [[AppDelegate appDelegate].drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//        }else{
//            
//            [self popViewControllerAnimated:YES];
//        }
//    }
    

}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 *  手势识别器对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效, NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 手势何时有效 : 当导航控制器的子控制器个数 > 1就有效
    return self.childViewControllers.count > 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)shouldAutorotate {
    return [[self.viewControllers lastObject] shouldAutorotate];
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
