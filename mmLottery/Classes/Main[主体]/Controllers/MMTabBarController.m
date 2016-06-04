//
//  MMTabBarController.m
//  mmLottery
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMTabBarController.h"
#import "MMBottomView.h"

@interface MMTabBarController ()

@end

@implementation MMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.加载子控制器
    [self setupChildVcs];
    
    // MARK: - 2.加载自定义的底部工具条
    [self setupBottomView];
    
//    self.selectedIndex = 2;
}

#pragma mark - 2.加载自定义的底部工具条
- (void)setupBottomView {

    // MARK: - 1.加载并显示自定义的视图
    // 1.创建
    MMBottomView *bottomView = [[MMBottomView alloc] init];
    
    // 1.2 赋值代码块
    bottomView.bottomBlock = ^(MMBottomView *bottomView, NSUInteger idx) {
        // 切换索引
        self.selectedIndex = idx;
    };
    
    // 2.设置frame信息&背景
    bottomView.frame = self.tabBar.bounds;
    bottomView.backgroundColor = MMRandomColor;
    
    // 让bottomView与系统的tabBar占全
//    bottomView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // 3.添加
    // 添加到tabBar身上
    [self.tabBar addSubview:bottomView];
    
    // MARK: - 2.遍历标签vc的子控制器,每遍历到一个,就让bottomView添加一个按钮
    // 1.遍历子控制器
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 拼接图片名称
        NSString *normalName = [NSString stringWithFormat:@"TabBar%@", @(idx + 1)];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar%@Sel", @(idx + 1)];
        
        // 让bottomView.添加一个按钮
        [bottomView addButtonWithImage:[UIImage imageNamed:normalName] andSelectImg:[UIImage imageNamed:selImgName]];
        
        
    }];
}


#pragma mark - 1.加载子控制器
- (void)setupChildVcs {
    
    // 大厅
    UINavigationController *navHall = [self navWithStoryboardName:@"MMHall"];
    
    // 竞技场
    UINavigationController *navArena = [self navWithStoryboardName:@"MMArena"];
    
    // 发现
    UINavigationController *navDiscovery = [self navWithStoryboardName:@"MMDiscovery"];
    
    // 开奖信息
    UINavigationController *navHistory = [self navWithStoryboardName:@"MMHistory"];
    
    // 我的彩票
    UINavigationController *navMyLottery = [self navWithStoryboardName:@"MMMyLottery"];
    
    
    // 添加子控制器
    self.viewControllers = @[navHall, navArena, navDiscovery, navHistory, navMyLottery];
    
}

/**
 *  根据故事板的名称创建控制器
 *
 *  @param sbName storyboard文件名
 *
 *  @return 带箭头的导航控制器
 */
- (UINavigationController *)navWithStoryboardName:(NSString *)sbName {
    
    
    // 1.加载故事板文件
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    // 2.实例化文件中的控制器
    UINavigationController *nav = [sboard instantiateInitialViewController];
    
    // 2.2 设置背景进行验证,保证能看到
    // 导航控制器的栈顶控制器 -> 修改它的背景色
    nav.topViewController.view.backgroundColor = MMRandomColor;
    
    // 设置底部的图片
    // 如果要用系统的tabBarItem设置图片,图片是非常小,而且没有文字!
    
    // 3.返回导航vc
    return nav;
    
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
