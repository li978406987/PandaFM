//
//  hotRecommends.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <Foundation/Foundation.h>

//第二个model的头文件
#import "List.h"
@interface hotRecommends : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSMutableArray *arrList;

@end
