//
//  MMSettingHomeController.m
//  mmLottery
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSettingHomeController.h"
// #import "MMRedeemCodeController.h"
#import "MMSettingCell.h"

#import "MMProductController.h"
@interface MMSettingHomeController ()

/**
 * 懒加载所有数据的数组
 */
@property (nonatomic, strong) NSArray *groupsArr;

@end

@implementation MMSettingHomeController

#pragma mark - 重写init方法,返回initWithStyle
- (instancetype)init {

    // 返回分组型的tableView
    return [super initWithStyle:UITableViewStyleGrouped];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView;
//    // MARK: - 1.Demo将字符串动态的转为一个OC中的方法,并执行方法
//    // 这个知识点,在很多第三方框架都有用到!
//    // 1.字符串
//    NSString *str = @"checkUpdate";
//    
//    // 2.将字符串转为方法
//    SEL selector = NSSelectorFromString(str);
//
//    // 3.执行方法,最好先判断
//    // 不要包@selector
//    if ([self respondsToSelector:selector]) {
//        
//        // 执行方法
//        [self performSelector:selector];
////        [self selector];
//        
//    } else {
//    
//        MMLog(@"不能调用此方法");
//    }

    
}

#pragma mark - 检查新版本
- (void)checkUpdate {

    // 1.vc
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    
    // 2.action
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    // 3.vc + action
    [alertVc addAction:action];
    
    // 4.present
    [self presentViewController:alertVc animated:YES completion:nil];

}

/**
 // MARK: - 1.判断并跳转到下一个控制器
 // 比较常用的写法
 if (indexPath.section == 0 && indexPath.row == 0) {
 
 // 1.创建对象
 MMRedeemCodeController *codeVc = [[MMRedeemCodeController alloc] init];
 
 // 纯代码创建的控制器控制器的视图默认是没有颜色!
 // 在push的时候,就会卡的感觉!设置个颜色就不卡了!
 // 2.跳转
 [self.navigationController pushViewController:codeVc animated:YES];
 
 }
 */
#pragma mark - 代理方法
// 选中某一行cell的时候调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // MARK: - 1.取出这一行的所有数据
    // 1.组
    NSDictionary *group = self.groupsArr[indexPath.section];
    // 2.所有行
    NSArray *items = group[@"MMItems"];
    // 3.该行
    NSDictionary *item = items[indexPath.row];
    
    // MARK: - 2.取出要执行的方法名字符串
    // 1.取方法名字符串
    NSString *funcStr = item[@"MMCallFunc"];
    
    if (funcStr.length > 0) {
        
        // 2.转为方法
        SEL selector = NSSelectorFromString(funcStr);
        // 3.判断并执行
        if ([self respondsToSelector:selector]) {
      
            // MARK: - 1.宏的作用,告诉编译器忽略到performSlector的警告!
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            // 执行方法的代码
            [self performSelector:selector];
            
#pragma clang diagnostic pop
            
        } else {
            
            MMLog(@"没有实现%@方法", funcStr);
        }
    }
    
    
    
    // MARK: - 3.取出目标vc字符串并做操作
    // 1.取出目标vc的字符串
    NSString *targetVcStr = item[@"MMTargetVc"];
    
    // 1.2 如果没有目标vc,直接返回
    if (targetVcStr.length == 0) {
        return;
    }
    
    // 2.将字符串转为类型
    Class className = NSClassFromString(targetVcStr);
    // 3.创建对象
    UIViewController *obj = [[className alloc] init];
    
    // 3.1 设置标题
    obj.navigationItem.title = item[@"MMTitle"];
    
    // 4.执行
    // 4.1 如果是设置类型的控制对象,需要设置要加载的plist文件
    if ([obj isKindOfClass:[MMSettingHomeController class]]) {
        
        // 1.强转为设置类型的vc
        MMSettingHomeController *settingXXXvc = (MMSettingHomeController *)obj;
        
        // 2.设置文件
        settingXXXvc.plistName = item[@"MMPlistName"];
        
        // 3.跳转
        [self.navigationController pushViewController:settingXXXvc animated:YES];
        
    } else {
    
        // 4.2其他可以直接跳转
        [self.navigationController pushViewController:obj animated:YES];
    }
    
}



#pragma mark - 数据源方法
// 组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groupsArr.count;
}

// 行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 1.取出该组的所有数据
    NSDictionary *group = self.groupsArr[section];
    // 2.取出改组内所有的行组成的数组
    NSArray *items = group[@"MMItems"];
    
    // 3.返回行数
    return items.count;
}





// cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // MARK: - 2.给cell赋值数据
    // MARK: - 2.1 取出这行的所有数据
    // 1 取出这行所在组的数据
    NSDictionary *group = self.groupsArr[indexPath.section];
    // 2 取出所有行的数据
    NSArray *items = group[@"MMItems"];
    // 3 取出这一行的数据
    NSDictionary *item = items[indexPath.row];
    
    // MARK: - 1.创建cell
    MMSettingCell *cell = [MMSettingCell cellWithTableView:tableView andItem:item];
    
    // MARK: - 2.2 赋值
    cell.cellItem = item;
    
        
    // MARK: - 3.返回cell
    return cell;

}

// 组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    NSDictionary *group = self.groupsArr[section];
    
    return group[@"MMHeader"];
}

// 组结尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    NSDictionary *group = self.groupsArr[section];
    
    return group[@"MMFooter"];

}

#pragma mark - 懒加载
- (NSArray *)groupsArr {

    if (_groupsArr == nil) {

        // 加载设置首页的所有数据
        _groupsArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
    }
    return _groupsArr;

}


@end
