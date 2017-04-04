//
//  leftViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "leftViewController.h"
#import "LX_NavgationViewController.h"
#import "LXTestTableViewController.h"
#import "AppDelegate.h"
#import "LX_TabBarViewController.h"

@interface leftViewController ()<UITableViewDelegate,UITableViewDataSource>

/** tableVIew */
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation leftViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self enableOpenCenterDrawer:YES];
}

// 即将出去后再打开 因为可能其他页面需要抽屉效果
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self enableOpenCenterDrawer:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"我是左边的页面";
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"test:%ld",indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UINavigationController* nav = (UINavigationController*)self.mm_drawerController.centerViewController;
    

    LX_NavgationViewController *nav = (LX_NavgationViewController *)[AppDelegate appDelegate].mainTabBarController.selectedViewController;
//
    
    LXTestTableViewController *testVc = [[LXTestTableViewController alloc] init];
    testVc.title = [NSString stringWithFormat:@"left-demo%lu",indexPath.row];
    [self.navigationController pushViewController:testVc animated:YES];
    
//    LXTestTableViewController *testVc = [[LXTestTableViewController alloc] init];
//    testVc.title = [NSString stringWithFormat:@"left-demo%lu",indexPath.row];
//    [self.navigationController pushViewController:testVc animated:YES];
    
//    if (![nav.visibleViewController isKindOfClass:[LXTestTableViewController class]]) {
////        [nav popToRootViewControllerAnimated:NO];
//        
//        LXTestTableViewController *testVc = [[LXTestTableViewController alloc] init];
//        testVc.title = [NSString stringWithFormat:@"left-demo%lu",indexPath.row];
//        [self.navigationController pushViewController:testVc animated:YES];
//    }
    
//    [[AppDelegate appDelegate].drawerController toggleDrawerSide:MMDrawerSideLeft animated:NO completion:nil];

}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
//        _tableView.backgroundColor = [UIColor redColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


@end
