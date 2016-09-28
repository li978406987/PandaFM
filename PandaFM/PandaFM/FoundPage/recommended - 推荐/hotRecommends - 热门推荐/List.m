//
//  List.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "List.h"

@implementation List

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        self.list = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            LJ_HotRecommendsModel *list = [[LJ_HotRecommendsModel alloc] initWithDic:dic];
            [_list addObject:list];
        }

    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
    
}


@end
