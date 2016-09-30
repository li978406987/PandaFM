//
//  DiscoveryColumns.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "DiscoveryColumns.h"

@implementation DiscoveryColumns

//容错方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

//数组Model的数据
- (void)setValue:(id)value forKey:(NSString *)key {
        if ([key isEqualToString:@"list"]) {
            NSArray *listDicArray = value;
            NSMutableArray *listArray = [NSMutableArray array];
            for (NSDictionary *dic in listDicArray) {
                FindingNovel_Model *list = [FindingNovel_Model modelWithDic:dic];
                [listArray addObject:list];
            }
            self.list = listArray;
        }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
}

@end
