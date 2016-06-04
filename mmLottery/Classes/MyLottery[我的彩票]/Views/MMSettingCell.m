//
//  MMSettingCell.m
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSettingCell.h"

@implementation MMSettingCell

#pragma mark - 创建cell的方法
+ (instancetype)cellWithTableView:(UITableView *)tableView andItem:(NSDictionary *)item {
    
    static NSString *ID = @"cell";
    MMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:[self styleWithItem:item] reuseIdentifier:ID];
    }
    
    return cell;
    
}

+ (UITableViewCellStyle)styleWithItem:(NSDictionary *)item {
    
    // 4 取出样式的字符串,再去确定样式!
    NSString *cellStyleStr = item[@"MMCellStyle"];
    
    if ([cellStyleStr isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        
        return UITableViewCellStyleSubtitle;
        
    } else if ([cellStyleStr isEqualToString:@"UITableViewCellStyleValue1"]) {
        
        return UITableViewCellStyleValue1;
        
    } else if ([cellStyleStr isEqualToString:@"UITableViewCellStyleValue2"]) {
        
        return UITableViewCellStyleValue2;
        
    } else {
        
        return UITableViewCellStyleDefault;
    }
    
    
}

#pragma mark - 设置时间
- (void)setTimeStr:(NSString *)timeStr {

    _timeStr = timeStr;
    
    // 内部设置时间!
    self.detailTextLabel.text =timeStr;
    
    // MARK: - 1.存储时间数据
    // 1.获取用户偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 2.存储数据
    [defaults setObject:timeStr forKey:self.cellItem[@"MMTimeKey"]];
    
    // 3.同步
    [defaults synchronize];
}

#pragma mark - 重写set方法分发数据
- (void)setCellItem:(NSDictionary *)cellItem {

    _cellItem = cellItem;
    
    // 1 设置图片
    if ([cellItem[@"MMIcon"] length] > 0) {
        self.imageView.image = [UIImage imageNamed:cellItem[@"MMIcon"]];
    }
    
    // 2 设置标题
    self.textLabel.text = cellItem[@"MMTitle"];
    
    // 2.2 设置子标题
    self.detailTextLabel.text = cellItem[@"MMSubtitle"];
    
    // 2.3 判断子标题是否需要显示为红色
    BOOL isHighLight = [cellItem[@"MMHighLight"] boolValue];
    
    if (isHighLight) {
        self.detailTextLabel.textColor = [UIColor redColor];
    } else {
        self.detailTextLabel.textColor = [UIColor grayColor];
    }
    
    // MARK: - 2.读取时间数据
    // 如果有MMTimeKey有值,再去读取时间
    if ([cellItem[@"MMTimeKey"] length] > 0)  {
        
        // 1.获取偏好设置
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // 2.读取时间
        NSString *timeStr = [defaults objectForKey:cellItem[@"MMTimeKey"]];
        
        // 3.如果读取出来时间了,再去设置
        if (timeStr.length > 0) {
            
            self.detailTextLabel.text = timeStr;
        }
        
    }
    
    
    
    // 3 设置箭头或开关
    //    cell.accessoryView
    // 3.1 取出类型的名称字符串
    NSString *classStr = cellItem[@"MMAccessoryType"];
    // 3.2 创建类
    Class className = NSClassFromString(classStr);
    // 3.3 创建对象
    id obj = [[className alloc] init];
    
    // 3.4 判断对象的类型
    // -如果是图片框
    if ([obj isKindOfClass:[UIImageView class]]) {
        
        // 目标: 赋值图片并显示
        // 1.强转为图片框
        UIImageView *imgView = (UIImageView *)obj;
        imgView.image = [UIImage imageNamed:cellItem[@"MMAccessoryName"]];
        
        [imgView sizeToFit];
        self.accessoryView = imgView;
        
    } else if ([obj isKindOfClass:[UISwitch class]]) {
        // -否则就开关
        UISwitch *switcher = (UISwitch *)obj;
        
        // MARK: - 1.监听开关的改变
        [switcher addTarget:self action:@selector(switcherValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        // MARK: - 2.读取开关状态
        // 1.获取偏好设置对象
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // 2.根据key去取值
        switcher.on = [defaults boolForKey:cellItem[@"MMKeyName"]];
        
        self.accessoryView = switcher;
    }
    

}

#pragma mark - 存储开关数据
- (void)switcherValueChanged:(UISwitch *)sender {
    
    // 1.获取用户偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // 2.存储数据
    [defaults setBool:sender.isOn forKey:self.cellItem[@"MMKeyName"]];
    
    // 3.同步
    [defaults synchronize];
}

@end
