//
//  ListCollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListCollectionViewCellDelegate <NSObject>

- (void)UPDataOfList;


@end

@interface ListCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<ListCollectionViewCellDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *arrayOfDatas;

@property (nonatomic, strong) NSMutableArray *focusImages;

@end
