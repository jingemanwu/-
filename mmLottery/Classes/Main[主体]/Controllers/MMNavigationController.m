//
//  MMNavigationController.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//  自定义的导航控制器

#import "MMNavigationController.h"

@interface MMNavigationController ()

@end

@implementation MMNavigationController

#pragma mark - 初始化方法
// 系统第一次初始化这个类的时候调用这个方法
// 而且只调用一次,比它更早的是load方法
+ (void)initialize {
    MMLog(@"initialize");
    
    // MARK: - 1.设置导航条的显示效果
    // 1.获取导航条的外观代理对象
    UINavigationBar *navBar = [UINavigationBar appearance];

    // 2.设置背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    // 3.设置标题颜色
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     }];
    
    // 4.设置两侧按钮的颜色
    [navBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark - 拦截系统的push操作!
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 注意:在跳转前设置隐藏工具条
    // 判断的原因:纯代码写的时候需要判断
    // 如果是拖线的,可以不判断.
    if (self.viewControllers.count > 0) {
    
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}



- (UIViewController *)popViewControllerAnimated:(BOOL)animated {

    return [super popViewControllerAnimated:animated];
}

@end
