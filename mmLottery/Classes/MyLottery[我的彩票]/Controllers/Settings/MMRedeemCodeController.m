//
//  MMRedeemCodeController.m
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMRedeemCodeController.h"

@interface MMRedeemCodeController ()

@end

@implementation MMRedeemCodeController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 颜色不要有透明度,否则还会卡!
    self.view.backgroundColor = MMRandomColor;
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
