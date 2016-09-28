//
//  FindingNovel_Model.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/23.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface FindingNovel_Model : LJ_BaseModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *contentType;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *subtitle;

@end
