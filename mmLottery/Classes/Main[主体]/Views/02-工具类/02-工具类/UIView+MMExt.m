//
//  UIView+MMExt.m
//  02-工具类
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIView+MMExt.h"

@implementation UIView (MMExt)

#pragma mark - 修改y值,及获取y值
- (void)setY:(CGFloat)y {

    // 1.取出控件的frame
    CGRect frame = self.frame;
    
    // 2.修改y值
    frame.origin.y = y;

    // 3.赋值给控件
    self.frame = frame;
}

- (CGFloat)y {
    
    return self.frame.origin.y;

}



@end
