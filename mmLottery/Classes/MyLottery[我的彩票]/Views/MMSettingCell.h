//
//  MMSettingCell.h
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSettingCell : UITableViewCell

#pragma mark - 创建cell的方法
+ (instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item;

/**
 *  绑定字典->等价于原有的模型
 */
@property (nonatomic, strong) NSDictionary *cellItem;

/**
 *  要显示的时间!
 */
@property (nonatomic, copy) NSString *timeStr;

@end
