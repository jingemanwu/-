//
//  MMBottomView.m
//  mmLottery
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMBottomView.h"
#import "MMBottomButton.h"

@interface MMBottomView ()

/**
 *  选中的底部按钮
 */
@property (nonatomic, weak) MMBottomButton *selectButton;

@end

@implementation MMBottomView

- (void)addButtonWithImage:(UIImage *)norImg andSelectImg:(UIImage *)selImg {
    // 1.创建按钮
    MMBottomButton *btn = [MMBottomButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置按钮的图片
    [btn setBackgroundImage:norImg forState:UIControlStateNormal];
    [btn setBackgroundImage:selImg forState:UIControlStateSelected];
    
//    btn.adjustsImageWhenHighlighted = NO;
    
    // 3.添加按钮
    [self addSubview:btn];
    
    // 4.监听事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 点击底部工具条的按钮时调用!
- (void)btnClick:(MMBottomButton *)sender {

    // MARK: - 1.修改按钮的状态,注意只有一个被选中
    // 1.清掉之前选中的
    self.selectButton.selected = NO;
    // 2.修改当前点击的
    sender.selected = YES;
    // 3.保存当前点击的
    self.selectButton = sender;
    
    // MARK: - 2.需要让标签vc切换选中的控制器
    // MARK: - 3.判断并执行block
    if (self.bottomBlock) {
        // 获取按钮的索引
        // 方法的作用:获取sender按钮在bottomView中的索引!
        // [self.subviews indexOfObject:sender];
        
        self.bottomBlock(self, [self.subviews indexOfObject:sender]);
    }
    
}

/**
 *  布局子控件
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // MARK: - 布局按钮
    // 多态:-> 父类指针指向子类的对象
    // 按钮的宽/高/y
    CGFloat btnWidth = self.width / self.subviews.count;
    CGFloat btnHeight = self.height;
    
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof MMBottomButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 按钮的x
        CGFloat btnX = idx * btnWidth;
        
        // 设置frame
        obj.frame = CGRectMake(btnX, btnY, btnWidth, btnHeight);
        
        // 设置默认的选中 选中购彩大厅
        if (idx == 4) {
            [self btnClick:obj];
        }
        
    }];
    
    
}

@end
