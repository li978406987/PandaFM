//
//  Horizontal_CollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LJ_HotRecommendsModel;

@protocol Horizontal_CollectionViewCellDelegate <NSObject>

- (void)UPDataOfHorizontal;


@end
@interface Horizontal_CollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<Horizontal_CollectionViewCellDelegate>delegate;



@property (nonatomic, strong) NSMutableArray *arrayOfShuffly;

@property (nonatomic, strong) NSMutableArray *arrayOfAll;

@property (nonatomic, strong) NSMutableArray *arrayOfFindNovel;

@property (nonatomic, strong) NSMutableArray *arrayOfOther;

@property (nonatomic, assign) NSInteger numIndexPath;

- (void)UP;

@end
