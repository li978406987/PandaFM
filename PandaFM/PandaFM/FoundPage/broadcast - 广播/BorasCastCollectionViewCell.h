//
//  BorasCastCollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BorasCastCollectionViewCellDelegate <NSObject>

- (void)UPDataOfBorasCast;


@end

@interface BorasCastCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<BorasCastCollectionViewCellDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *arrayOfBroadcast;
@property (nonatomic, strong) NSMutableArray *arrayOfCategories;
@end
