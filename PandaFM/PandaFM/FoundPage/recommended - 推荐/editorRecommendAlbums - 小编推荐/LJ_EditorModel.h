//
//  LJ_EditorModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_EditorModel : LJ_BaseModel

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, strong) NSString *intro;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *coverLarge;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, strong) NSString *trackTitle;

@property (nonatomic, assign) NSInteger trackId;

@end
