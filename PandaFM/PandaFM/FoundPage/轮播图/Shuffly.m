//
//  Shuffly.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Shuffly.h"

@implementation Shuffly

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"list"]) {
        NSArray *listDicArray = value;
        NSMutableArray *listArray = [NSMutableArray array];
        for (NSDictionary *dic in listDicArray) {
            Shuffly_Model *list = [Shuffly_Model modelWithDic:dic];
            [listArray addObject:list];
        }
        self.list = listArray;
    }
    
}


@end
