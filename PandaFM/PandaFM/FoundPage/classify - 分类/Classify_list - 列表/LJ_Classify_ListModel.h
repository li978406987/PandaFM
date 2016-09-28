//
//  LJ_Classify_ListModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_Classify_ListModel : LJ_BaseModel

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *coverPath;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, strong) NSString *contentType;

@property (nonatomic, assign) NSInteger categoryType;


@end
