//
//  LJ_BoradCastModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_BoradCastModel : LJ_BaseModel

@property (nonatomic, strong) NSString *coverLarge;

@property (nonatomic, assign) NSInteger fmUid;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, strong) NSMutableArray *playUrl;

@property (nonatomic, strong) NSString *programName;

@property (nonatomic, assign) NSInteger programId;

@property (nonatomic, assign) NSInteger programScheduleId;

@end
