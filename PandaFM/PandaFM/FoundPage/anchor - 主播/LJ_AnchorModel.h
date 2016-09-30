//
//  LJ_AnchorModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_AnchorModel : LJ_BaseModel

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *largeLogo;
@property (nonatomic, strong) NSString *personDescribe;

@property (nonatomic, strong) NSString *verifyTitle;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger followersCounts;

@end
