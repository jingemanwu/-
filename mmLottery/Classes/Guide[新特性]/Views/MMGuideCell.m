//
//  MMGuideCell.m
//  mmLottery
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGuideCell.h"
#import "MMTabBarController.h"

@implementation MMGuideCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // MARK: - 1.添加按钮,并且监听事件
        // 1.创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 2.设置图片
        [btn setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        // 3.调整大小
        [btn sizeToFit];
        
        btn.x = (self.width - btn.width) * 0.5;
        btn.y = self.height * 0.85;
        // 4.添加
        [self.contentView addSubview:btn];
        // 5.监听事件
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 6.赋值
        _experienceBtn = btn;
        
    }
    return self;
}

- (void)btnClick {

    MMLog(@"立即体验!");
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MMTabBarController alloc] init];
}

@end
