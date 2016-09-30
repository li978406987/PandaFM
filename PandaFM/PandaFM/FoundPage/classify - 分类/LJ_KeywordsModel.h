//
//  LJ_KeywordsModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/30.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_KeywordsModel : LJ_BaseModel

@property (nonatomic, strong) NSString *keywordName;

@property (nonatomic, assign) NSInteger keywordId;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, assign) NSInteger realCategoryId;

@property (nonatomic, assign) NSInteger keywordType;



@end
