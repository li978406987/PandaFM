//
//  CityColumn.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityColumn : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *list;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString *contentType;


@end
