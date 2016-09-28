//
//  EditorRecommendAlbums.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "EditorRecommendAlbums.h"

@implementation EditorRecommendAlbums

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            LJ_EditorModel *list = [LJ_EditorModel modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    
    
}



@end
