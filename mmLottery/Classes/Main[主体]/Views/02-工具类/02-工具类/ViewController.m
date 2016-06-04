//
//  ViewController.m
//  02-工具类
//
//  Created by Apple on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MMExt.h"

@interface ViewController ()

// 明珠按钮
@property (nonatomic, weak) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    btn.backgroundColor = [UIColor magentaColor];
    [btn setTitle:@"明珠" forState:UIControlStateNormal];
    
    [self.view addSubview:btn];
    
    _button = btn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 修改按钮的frame的y值到400去
    
    self.button.y = 400;
    
    
    
    
//    // 以前的做法
//    // 1.取出按钮的frame
//    CGRect frame = self.button.frame;
//    // 2.修改frame.origin.y
//    frame.origin.y = 400;
//    // 3.赋值回去
//    self.button.frame = frame;
}

@end
