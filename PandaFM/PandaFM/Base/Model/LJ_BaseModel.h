//
//  LJ_BaseModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/20.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJ_BaseModel : NSObject

- (instancetype) initWithDic:(NSDictionary *)dic;


+ (instancetype) modelWithDic:(NSDictionary *)dic;


@end
