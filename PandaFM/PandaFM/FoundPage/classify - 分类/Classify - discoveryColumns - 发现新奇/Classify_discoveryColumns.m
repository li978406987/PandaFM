//
//  Classify_discoveryColumns.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Classify_discoveryColumns.h"

@implementation Classify_discoveryColumns

//容错方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

//数组Model的数据
- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            LJ_ClassifyModel *list = [LJ_ClassifyModel modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
}

@end
