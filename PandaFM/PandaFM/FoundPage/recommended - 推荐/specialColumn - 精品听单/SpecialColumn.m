//
//  SpecialColumn.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "SpecialColumn.h"

@implementation SpecialColumn

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            LJ_SpecialColumnModel *list = [LJ_SpecialColumnModel modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    
}


@end
