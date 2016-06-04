//
//  MMAboutController.m
//  mmLottery
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAboutController.h"

@interface MMAboutController ()

@end

@implementation MMAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.显示headerView
    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MMAboutHeaderView" owner:nil options:nil] lastObject];
}

#pragma mark - 防止headerView盖住第一个cell
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 20;

}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    
//    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
//}

#pragma mark - 评分支持
- (void)scoreSupport {

    MMLog(@"评分");

}

#pragma mark - 电话
- (void)callKFMM {
    
    MMLog(@"电话");
    
}


@end
