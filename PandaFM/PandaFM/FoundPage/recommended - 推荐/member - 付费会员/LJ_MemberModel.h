//
//  LJ_MemberModel.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseModel.h"

@interface LJ_MemberModel : LJ_BaseModel

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *nickname;

@property (nonatomic, strong) NSString *bannerUrl;

@property (nonatomic, strong) NSString *subTitle;



@end
