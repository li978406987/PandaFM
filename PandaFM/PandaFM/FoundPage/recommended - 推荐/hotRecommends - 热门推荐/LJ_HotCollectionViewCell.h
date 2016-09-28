//
//  LJ_HotCollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJ_HotRecommendsModel;
@interface LJ_HotCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) LJ_HotRecommendsModel *modelOfHot;
@end
