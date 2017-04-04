
//
//  LX_TabBarViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "LX_TabBarViewController.h"
#import "LX_NavgationViewController.h"
#import "oneViewController.h"
#import "twoViewController.h"



@interface LX_TabBarViewController ()
{
    oneViewController *_oneVc;
    twoViewController *_twoVc;
}

@property (nonatomic, strong) UIView *itemSelectedBg;


@end

@implementation LX_TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAllChildViewcontrollers];
    
    // 添加选中的背景
    self.itemSelectedBg = [[UIView alloc] init];
    self.itemSelectedBg.frame = CGRectMake(0, 0, 375 / 2, 49);
    self.itemSelectedBg.backgroundColor = [UIColor greenColor];
    [self.tabBar addSubview:self.itemSelectedBg];
}


#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSInteger index = tabBarController.selectedIndex;
    self.itemSelectedBg.frame = CGRectMake(index * 375 / 2, 0, 375 / 2, 49);
    switch (index) {
        case 0:
        {
            self.itemSelectedBg.backgroundColor = [UIColor greenColor];
            
            
        }
            break;
        case 1:
        {
            self.itemSelectedBg.backgroundColor = [UIColor orangeColor];
            
            
            
        }
            break;            
        default:
            break;
    }
}


- (void)setUpAllChildViewcontrollers{
    _oneVc = [[oneViewController alloc] init];
    [self setUpChildController:_oneVc withTitle:@"首页" imgName:@"tabBarhomeNormal" selectedImgName:@"tabBarhomeSelected"];
    
    _twoVc =[[twoViewController alloc] init];
    [self setUpChildController:_twoVc withTitle:@"发现" imgName:@"tabBarmessageNormal" selectedImgName:@"tabBarmessageSelected"];
}


- (void)setUpChildController:(UIViewController *)childVC withTitle:(NSString *)title imgName:(NSString *)imageName selectedImgName:(NSString *)selectedImage{
    //包装一个导航控制器
    LX_NavgationViewController *childNav = [[LX_NavgationViewController alloc] initWithRootViewController:childVC];
//    childVC.tabBarItem.tag = itemTag;
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil] forState:(UIControlStateSelected)];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor],NSForegroundColorAttributeName, nil] forState:(UIControlStateNormal)];
    
    
    
    childVC.tabBarItem.title = title;
    childNav.navigationBar.hidden = NO;
    [self addChildViewController:childNav];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
