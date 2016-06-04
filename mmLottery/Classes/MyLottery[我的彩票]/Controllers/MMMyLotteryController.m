//
//  MMMyLotteryController.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMMyLotteryController.h"
#import "MMSettingHomeController.h"

@interface MMMyLotteryController ()

/**
 *  注册按钮
 */
@property (nonatomic, weak) IBOutlet UIButton *registerBtn;

@end

@implementation MMMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.拉伸图片
    UIImage *image = [UIImage imageNamed:@"RedButtonPressed"];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    // 2.设置为按钮的背景图片
    [self.registerBtn setBackgroundImage:image forState:UIControlStateNormal];
}

#pragma mark - 点击右侧item时的调用
- (IBAction)configItemClick {
    
    // 1.创建设置控制器对象
    MMSettingHomeController *settingHome = [[MMSettingHomeController alloc] init];
    
    // 1.2 设置标题
    settingHome.navigationItem.title = @"设置";
    
    // 1.3 设置要加载的plist文件名称
    settingHome.plistName = @"MMSettingHome";
    
    // 2.跳转
    [self.navigationController pushViewController:settingHome animated:YES];


}




@end
