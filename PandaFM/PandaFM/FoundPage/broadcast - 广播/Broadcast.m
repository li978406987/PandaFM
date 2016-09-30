//
//  Broadcast.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Broadcast.h"

@implementation Broadcast

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}


- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"localRadios"]) {
        NSArray *array = value;
        NSMutableArray *arrayOfValie = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            LJ_BoradCastModel *model = [[LJ_BoradCastModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [arrayOfValie addObject:model];
        }
        self.localRadios = arrayOfValie;
    }
    if ([key isEqualToString:@"topRadios"]) {
        NSArray *array = value;
        NSMutableArray *arrayOfValue = [NSMutableArray array];
        for (NSDictionary *dic in array) {
            LJ_BoradCastModel *model = [[LJ_BoradCastModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [arrayOfValue addObject:model];
        }
        self.topRadios = arrayOfValue;
    }
    if ([key isEqualToString:@"location"]) {
        self.location = value;
    }

}

@end
