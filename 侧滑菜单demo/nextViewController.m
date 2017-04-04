

//
//  nextViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/29.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "nextViewController.h"

@interface nextViewController ()

@end

@implementation nextViewController


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
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.title = @"我是最后一个";
    
    UILabel *lable = [[UILabel alloc] init];
    lable.frame = CGRectMake(120, 200, 200, 40);
    lable.text = @"不能跳转了";
    [self.view addSubview:lable];
    
    
    
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
