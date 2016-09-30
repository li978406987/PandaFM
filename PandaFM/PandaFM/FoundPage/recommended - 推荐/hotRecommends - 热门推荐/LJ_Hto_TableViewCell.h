//
//  LJ_Hto_TableViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJ_HotRecommendsModel;
@interface LJ_Hto_TableViewCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray *arrayOfHot;
@property (nonatomic, strong) List *list;
@property (nonatomic, strong) LJ_HotRecommendsModel *modelOfHotRecommends;

@end
