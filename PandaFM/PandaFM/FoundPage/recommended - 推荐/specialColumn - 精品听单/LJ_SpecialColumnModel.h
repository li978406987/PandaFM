//
//  LJ_SpecialColumnModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_SpecialColumnModel : LJ_BaseModel

@property (nonatomic, assign) NSInteger columnType;

@property (nonatomic, assign) NSInteger specialId;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subtitle;

@property (nonatomic, strong) NSString *footnote;

@property (nonatomic, strong) NSString *coverPath;

@property (nonatomic, assign) NSInteger contentType;


@end
