

//
//  oneViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "oneViewController.h"
#import "centerPushViewController.h"
#import "MMExampleDrawerVisualStateManager.h"

@interface oneViewController ()

@end

@implementation oneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeSlideAndScale];
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor blueColor];
    
    UIBarButtonItem *lefteItme = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navgationBarmoreBlack"] style:0 target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.leftBarButtonItem = lefteItme;
    
    LXLogFunc;
    
    UIButton *push = [UIButton buttonWithType:UIButtonTypeCustom];
    [push setTitle:@"push" forState:UIControlStateNormal];
    push.frame = CGRectMake(50, 100, 60, 60);
    [push addTarget:self action:@selector(pushVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
    
    
    
}

- (void)pushVc{
    centerPushViewController *oneVc = [[centerPushViewController alloc] init];
    [self.navigationController pushViewController:oneVc animated:YES];
}



- (void)leftBarButtonItemClick{
    NSLog(@"左侧打开菜单");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

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
