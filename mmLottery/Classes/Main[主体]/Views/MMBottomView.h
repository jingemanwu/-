//
//  MMBottomView.h
//  mmLottery
//
//  Created by Apple on 16/5/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

// MARK: -1.给block起别名
// 两个参数  自己 & 索引
@class MMBottomView;
typedef void(^BottomViewBlock)(MMBottomView *, NSUInteger);

@interface MMBottomView : UIView
/**
 *  添加按钮的方法
 *
 *  @param norImg 普通的图片
 *  @param selImg 选中的图片
 */
- (void)addButtonWithImage:(UIImage *)norImg andSelectImg:(UIImage *)selImg;

// MARK: - 2.定义block变量
@property (nonatomic, copy) BottomViewBlock bottomBlock;


@end
