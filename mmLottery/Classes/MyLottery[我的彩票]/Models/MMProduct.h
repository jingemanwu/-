//
//  MMProduct.h
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMProduct : NSObject


/**
*  标题
*/
@property (nonatomic, copy) NSString *title;

/**
 *  子标题
 */
@property (nonatomic, copy) NSString *stitle;

/**
 *  根据id及customUrl可以做应用之间的跳转
 */
@property (nonatomic, copy) NSString *ID;

/**
 *  在appStore显示的链接
 */
@property (nonatomic, copy) NSString *url;

/**
 *  图片
 */
@property (nonatomic, copy) NSString *icon;

/**
 *  配和id,去做应用之间的跳转
 */
@property (nonatomic, copy) NSString *customUrl;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)productModelWithDict:(NSDictionary *)dict;


@end
