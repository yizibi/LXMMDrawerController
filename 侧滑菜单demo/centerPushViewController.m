

//
//  centerPushViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/29.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "centerPushViewController.h"
#import "nextViewController.h"

@interface centerPushViewController ()

@end

@implementation centerPushViewController

// 即将进来页面后关闭抽屉
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self enableOpenLeftDrawer:NO];
    [self enableOpenRightDrawer:NO];
}

// 即将出去后再打开 因为可能其他页面需要抽屉效果
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self enableOpenLeftDrawer:YES];
    [self enableOpenRightDrawer:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我是中间push";
    
    self.view.backgroundColor = [UIColor redColor];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(120, 200, 200, 40);
    lable.text = @"我是从中间跳转的";
    [self.view addSubview:lable];
    
    
    UIButton *push = [UIButton buttonWithType:UIButtonTypeCustom];
    [push setTitle:@"nextPage-click" forState:UIControlStateNormal];
    push.frame = CGRectMake(50, 100, 160, 60);
    [push addTarget:self action:@selector(pushVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:push];
}


- (void)pushVc{
    nextViewController *nextVc = [[nextViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
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
