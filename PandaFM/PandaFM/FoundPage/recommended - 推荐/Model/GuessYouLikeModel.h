//
//  GuessYouLikeModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/30.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface GuessYouLikeModel : LJ_BaseModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, strong) NSString *trackTitle;

@property (nonatomic, strong) NSString *recReason;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, strong) NSString *intro;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *coverLarge;

@property (nonatomic, strong) NSString *tags;

@property (nonatomic, assign) NSInteger tracks;


@end
