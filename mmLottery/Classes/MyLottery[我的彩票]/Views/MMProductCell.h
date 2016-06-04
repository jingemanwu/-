//
//  MMProductCell.h
//  mmLottery
//
//  Created by Apple on 16/5/31.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMProduct;
@interface MMProductCell : UICollectionViewCell

/**
 *  绑定模型数据,接收控制器的传值
 */
@property (nonatomic, strong) MMProduct *productModel;

@end
