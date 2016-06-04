//
//  MMAllCategoryButton.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAllCategoryButton.h"

@implementation MMAllCategoryButton

#pragma mark - 重写layoutSubViews方法调整图片框和文字label的位置
- (void)layoutSubviews {

    [super layoutSubviews];
    
    // 修改位置
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5;

}

@end
