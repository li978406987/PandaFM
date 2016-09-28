//
//  hotRecommends.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "hotRecommends.h"

@implementation hotRecommends

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        self.arrList = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            List *list = [[List alloc] init];
            [list setValuesForKeysWithDictionary:dic];
            [_arrList addObject:list];
        }
    }
    if ([key isEqualToString:@"title"]) {
        self.title = value;
    }
}


@end
