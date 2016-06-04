//
//  MMScoreLiveController.m
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMScoreLiveController.h"
#import "MMSettingCell.h"

@interface MMScoreLiveController ()

/**
 *  懒加载文本框
 */
@property (nonatomic, strong) UITextField *field;

/**
 *  datePicker
 */
@property (nonatomic, strong) UIDatePicker *datePicker;

/**
 *  toolbar
 */
@property (nonatomic, strong) UIToolbar *toolbar;

/**
 *  被选中的cell
 */
@property (nonatomic, weak) MMSettingCell *selectCell;

@end

@implementation MMScoreLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - 单独实现一次didSelect方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MMLog(@"%@, %@", @(indexPath.section), @(indexPath.row));

    // 0.如果是第0组,直接返回
    if (indexPath.section == 0) {
        return;
    }
    
    
//    [self becomeFirstResponder];
    // MARK: - 需要让文本框成为第一响应者,把键盘叫出!键盘要被替换为UIDatePicker;
    // 1.获取选中的cell
    MMSettingCell *selCell = [tableView cellForRowAtIndexPath:indexPath];
    _selectCell = selCell;
    
    // 2.给cell添加文本框
    [selCell addSubview:self.field];
    
    // 3.让文本框成为第一响应者
    [self.field becomeFirstResponder];
    
}


#pragma mark - 懒加载控件
- (UITextField *)field {
    
    if (_field == nil) {
        _field = [[UITextField alloc] init];
        
        _field.inputView = self.datePicker;
        _field.inputAccessoryView = self.toolbar;
    }
    return _field;
}

- (UIDatePicker *)datePicker {
    
    if (_datePicker == nil) {
        
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeTime;
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        
    }
    return _datePicker;
    
}

- (UIToolbar *)toolbar {
    
    if (_toolbar == nil) {
        
        // 2.工具条 UIToolBar - > 对应的事件设置时间
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 0, 44)];
        
        // 取消,弹簧,确定
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelItemAction)];
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(confirmItemAction)];
        _toolbar.items = @[cancelItem, flex, confirmItem];
        
    }
    return _toolbar;
    
}
#pragma mark - 取消
- (void)cancelItemAction {
    
    [self.view endEditing:YES];
}

#pragma mark - 确定
- (void)confirmItemAction {
    
    // 1.获取时间
    NSDate *date = self.datePicker.date;
    
    // 2.指定格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm"; // ss  yy:MM:dd
    
    // 3.将时间转为字符串
    NSString *timeStr = [formatter stringFromDate:date];
    
    // 4.赋值给选中的cell
//    _selectCell.detailTextLabel.text = timeStr;
    self.selectCell.timeStr = timeStr;
    
    // 5.关闭键盘
    [self.view endEditing:YES];
    
    
}




@end
