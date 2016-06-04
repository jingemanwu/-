//
//  MMProductCell.m
//  mmLottery
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProductCell.h"
#import "MMProduct.h"

@interface MMProductCell ()

/**
 *  应用的图标
 */
@property (nonatomic, weak) IBOutlet UIImageView *iconView;

/**
 *  应用的名称
 */
@property (nonatomic, weak) IBOutlet UILabel *titleLbl;

@end



@implementation MMProductCell


#pragma mark - 重写模型的set方法,分发数据
- (void)setProductModel:(MMProduct *)productModel {

    // MARK: - 1.做个赋值操作,方便其他地方使用!
    _productModel = productModel;

    // 设置数据,图片和label
    self.iconView.image = [UIImage imageNamed:productModel.icon];
    self.titleLbl.text = productModel.title;
    
}

#pragma mark - 将图片框裁剪为圆角
- (void)awakeFromNib {

    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;

}


@end
