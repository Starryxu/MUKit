//
//  MUKitDemoMVVMTableViewController.m
//  MUKit
//
//  Created by Jekity on 2017/8/17.
//  Copyright © 2017年 Jeykit. All rights reserved.
//

#import "MUKitDemoMVVMTableViewController.h"
#import <MUTableViewManager.h>
#import "MUTableViewController.h"
#import "MUKitDemoDynamicRowHeightController.h"
@interface MUKitDemoMVVMTableViewController ()
@property(nonatomic, strong)MUTableViewManager *tableViewManger;
@end

static NSString *const cellReusedIndentifier = @"cell";
@implementation MUKitDemoMVVMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MVVMTableView";
    [self configuredDataSource];
    [self configuredCell];
}
#pragma -mark init
-(void)configuredDataSource{
    _tableViewManger = [[MUTableViewManager alloc]initWithTableView:self.tableView registerCellClass:NSStringFromClass([UITableViewCell class]) subKeyPath:nil];;
    _tableViewManger.modelArray = [@[@"Customer",@"Manager",@"Dynamic row height"] mutableCopy];
    
}

-(void)configuredCell{
    self.tableViewManger.renderBlock = ^UITableViewCell *(UITableViewCell *cell, NSIndexPath *indexPath, id model, CGFloat *height) {
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model];
        return cell;
        
    };
    __weak typeof(self) weakSelf = self;
    self.tableViewManger.selectedCellBlock = ^(UITableView *tableView, NSIndexPath *indexPath, id model, CGFloat *height)
        
        {
            
            if (indexPath.row == 0) {
                
                MUTableViewController  *controller = [MUTableViewController new];
                controller.type = MemberTypeEmployee;
                [weakSelf.navigationController pushViewController:controller animated:YES];
                return ;
            }
            
            if (indexPath.row == 1) {
                
                MUTableViewController  *controller = [MUTableViewController new];
                controller.type = MemberTypeManager;
                [weakSelf.navigationController pushViewController:controller animated:YES];
                return ;
            }
            
            if (indexPath.row == 2) {
                
                MUKitDemoDynamicRowHeightController  *controller = [MUKitDemoDynamicRowHeightController new];
                [weakSelf.navigationController pushViewController:controller animated:YES];
                return ;
            }
        };
    
}

@end
