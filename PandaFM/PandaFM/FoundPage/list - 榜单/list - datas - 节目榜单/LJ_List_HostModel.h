//
//  LJ_List_HostModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_List_HostModel : LJ_BaseModel
@property (nonatomic, strong) NSString *rankingListId;

@property (nonatomic, strong) NSString *coverPath;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subtitle;

@property (nonatomic, strong) NSString *contentType;

@property (nonatomic, strong) NSString *rankingRule;

@property (nonatomic, strong) NSString *period;

@property (nonatomic, strong) NSString *firstId;

@property (nonatomic, strong) NSString *firstTitle;

@property (nonatomic, strong) NSString *calcPeriod;

@property (nonatomic, strong) NSString *top;

@property (nonatomic, strong) NSMutableArray *firstKResults;

@end
