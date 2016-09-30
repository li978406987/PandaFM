//
//  LJ_HotRecommendsModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_HotRecommendsModel : LJ_BaseModel

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *coverLarge;

@property (nonatomic, strong) NSString *trackTitle;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger commentsCount;

@property (nonatomic, assign) NSInteger priceTypeId;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, assign) NSInteger priceTypeEnum;

@property (nonatomic, assign) NSString *displayPrice;

@property (nonatomic, assign) NSInteger id;

@property (nonatomic, assign) NSInteger uid;







@end
