
//
//  LXTestTableViewController.m
//  侧滑菜单demo
//
//  Created by 李lucy on 17/3/27.
//  Copyright © 2017年 com.muyandialog.Co.,Ltd. All rights reserved.
//

#import "LXTestTableViewController.h"
#import "LX_NavgationViewController.h"
#import "AppDelegate.h"
#import "LX_TabBarViewController.h"
#import "LXTestoneViewController.h"

@interface LXTestTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation LXTestTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.tableView];
    
    
//    [self configureLeftBarButtonWithTitle:@"返回" action:^{
//       [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
//    }];
    
    
}



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        //        _tableView.backgroundColor = [UIColor redColor];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"testCellID"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCellID" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"test:%ld",indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LX_NavgationViewController *nav = (LX_NavgationViewController *)[AppDelegate appDelegate].mainTabBarController.selectedViewController;
    
    
    LXTestoneViewController *testVc = [[LXTestoneViewController alloc] init];
    testVc.title = [NSString stringWithFormat:@"三级-demo%lu",indexPath.row];
    
    
    [self.navigationController pushViewController:testVc animated:YES];
//    LXTestoneViewController *testVc = [[LXTestoneViewController alloc] init];
//    testVc.title = [NSString stringWithFormat:@"三级-demo%lu",indexPath.row];
//    [[AppDelegate appDelegate].leftNavVc pushViewController:testVc animated:YES];
    
    
//    if (![nav.visibleViewController isKindOfClass:[LXTestoneViewController class]]) {
//        
//        LXTestoneViewController *testVc = [[LXTestoneViewController alloc] init];
//        testVc.title = [NSString stringWithFormat:@"三级-demo%lu",indexPath.row];
//        
//        
//        [self.navigationController pushViewController:testVc animated:YES];
//    }
//    
    

//    [[AppDelegate appDelegate].drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
