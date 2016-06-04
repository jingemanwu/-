//
//  MMGroupButyController.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGroupButyController.h"
#import "MMAllCategoryButton.h"

@interface MMGroupButyController ()

/**
 *  蓝色视图
 */
@property (nonatomic, weak) UIView *blueView;

@end

@implementation MMGroupButyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.蓝色的视图
    UIView *blueV = [[UIView alloc] init];
    
    blueV.backgroundColor = MMRandomColor;
    // 设置frame信息
    blueV.x = 0;
    blueV.y = 64;
    blueV.width = self.view.width;
    blueV.height = 0;
    
    [self.view addSubview:blueV];
    
    // 赋值
    _blueView = blueV;
    
}

#pragma mark - 点击全部彩种按钮调用
- (IBAction)topButtonClick:(MMAllCategoryButton *)sender {

    // MARK: - 目标:显示蓝色菜单,让图片框旋转!
    // 判断按钮的图片框的transform是否干净?
    // 记录高度的height
    CGFloat height = 0;
    // 记录transform的变量
    CGAffineTransform tranform;
    
    // 判断按钮的图片框是否有形变!
    if (CGAffineTransformIsIdentity(sender.imageView.transform)) {
        
        //        self.blueView.height = 200;
        height = 200;
        tranform = CGAffineTransformMakeRotation(M_PI * 0.99999);
        
    } else {
        
        //        self.blueView.height = 0;
        height = 0;
        
        // 清除所有的形变 Identity 最初的效果!
        tranform = CGAffineTransformIdentity;
    }
    
    
    // 2.通过动画修改
    [UIView animateWithDuration:0.5 animations:^{
        
        self.blueView.height = height;
        sender.imageView.transform = tranform;
        
    }];

    
   
}

- (void)demo1:(MMAllCategoryButton *)sender {

    // 如果高度是 200 -> 0 如果是0 -> 200;
    // 1.判断蓝色视图的高度
    CGFloat height = 0;
    // 记录transform的变量
    CGAffineTransform tranform;
    
    if (self.blueView.height == 0) {
        
        //        self.blueView.height = 200;
        height = 200;
        tranform = CGAffineTransformMakeRotation(M_PI);
        
    } else {
        
        //        self.blueView.height = 0;
        height = 0;
        
        // 清除所有的形变 Identity 最初的效果!
        tranform = CGAffineTransformIdentity;
    }
    
    
    // 2.通过动画修改
    [UIView animateWithDuration:0.5 animations:^{
        
        self.blueView.height = height;
        sender.imageView.transform = tranform;
        
    }];

}


@end
