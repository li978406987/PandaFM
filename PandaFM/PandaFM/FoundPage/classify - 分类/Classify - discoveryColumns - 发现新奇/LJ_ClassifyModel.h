//
//  LJ_ClassifyModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJ_ClassifyModel : LJ_BaseModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *coverPath;

@property (nonatomic, strong) NSString *contentType;

@property (nonatomic, strong) NSDictionary *properties;

@end
