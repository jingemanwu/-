//
//  MMProduct.m
//  mmLottery
//
//  Created by Apple on 16/5/29.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProduct.h"

@implementation MMProduct

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // KVC的前提,字典里面所有的key,与自己的属性是一一对应的!
        // id 与ID 不一样
//        [self setValuesForKeysWithDictionary:dict];
        
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
        self.stitle = dict[@"stitle"];
        self.url = dict[@"url"];
        self.ID = dict[@"id"];
        self.customUrl = dict[@"customUrl"];
    }
    
    return self;
}

+ (instancetype)productModelWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}


@end
