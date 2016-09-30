//
//  LJ_Classify_ListModel.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Classify_ListModel.h"

@implementation LJ_Classify_ListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.ID = value;
        
    }
}

@end
