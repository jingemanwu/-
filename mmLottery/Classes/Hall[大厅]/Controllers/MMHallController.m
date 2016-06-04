//
//  MMHallController.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//  购彩大厅

#import "MMHallController.h"

@interface MMHallController ()

@end

@implementation MMHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.设置左侧的活动按钮
    // 1.创建按钮,并设置图片
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    btn.adjustsImageWhenHighlighted = NO;
    btn.showsTouchWhenHighlighted = YES;
    [btn sizeToFit]; // 调整大小
    
    [btn addTarget:self action:@selector(acivityBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 2.需要将按钮保证成item
    UIBarButtonItem *activityItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = activityItem;
}

- (void)acivityBtnClick {
    
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
