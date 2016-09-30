//
//  CityColumn.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "CityColumn.h"

@implementation CityColumn

//容错方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            LJ_CityColumnModel *list = [LJ_CityColumnModel modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    if ([key isEqualToString:@"count"]) {
        self.count = [value intValue];
    }
    if ([key isEqualToString:@"contentType"]) {
        self.contentType = value;
    }
    
}



@end
