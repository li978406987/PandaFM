//
//  AnchorCollectionViewCell.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AnchorCollectionViewCellDelegate <NSObject>

- (void)UPDataOfAnchor;

@end

@interface AnchorCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<AnchorCollectionViewCellDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *arrayOfAnchor;

@end
