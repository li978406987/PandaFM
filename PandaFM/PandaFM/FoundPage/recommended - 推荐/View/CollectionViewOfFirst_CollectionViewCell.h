//
//  CollectionViewOfFirst_CollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CollectionViewOfFirst_Model;
@interface CollectionViewOfFirst_CollectionViewCell : UICollectionViewCell
@property (nonatomic, retain) CollectionViewOfFirst_Model *modelOfFirst;

@property (nonatomic, assign) BOOL isSeleted;

@end
