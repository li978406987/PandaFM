//
//  Guess.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Guess.h"

@implementation Guess

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            LJ_GuessModel *list = [LJ_GuessModel modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    
}

//- (void)setList:(NSMutableArray *)list {
////    self.list = list;
//    
//    NSMutableArray *array = [NSMutableArray array];
//    
//    for (NSDictionary *dic in list) {
//        Guess *guessListModel = [[Guess alloc] init];
//        [guessListModel setValuesForKeysWithDictionary:dic];
//        [array addObject:guessListModel];
//    }
//
//    _list = [NSMutableArray arrayWithArray:array];
//}

@end
