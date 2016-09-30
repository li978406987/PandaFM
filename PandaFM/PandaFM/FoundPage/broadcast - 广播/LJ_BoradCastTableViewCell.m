//
//  LJ_BoradCastTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BoradCastTableViewCell.h"


@interface LJ_BoradCastTableViewCell ()
<UICollectionViewDataSource,
UICollectionViewDelegate
>
@property (nonatomic, strong) UICollectionView *collectionOfBoradCast;

@end
@implementation LJ_BoradCastTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(LJScreenW, 80);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 5;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionOfBoradCast = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _collectionOfBoradCast.backgroundColor = [UIColor whiteColor];
        
        _collectionOfBoradCast.pagingEnabled = YES;
        _collectionOfBoradCast.delegate = self;
        _collectionOfBoradCast.dataSource = self;
        [self addSubview:_collectionOfBoradCast];
        self.collectionOfBoradCast.scrollEnabled = NO;
        
        [_collectionOfBoradCast registerClass:[LJ_BoradCastCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfBoradCast"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionOfBoradCast.frame = self.contentView.bounds;
    
}

- (void)setArrayOfBoradCastTableViewCell:(NSMutableArray *)arrayOfBoradCastTableViewCell{
    if (_arrayOfBoradCastTableViewCell != arrayOfBoradCastTableViewCell) {
        _arrayOfBoradCastTableViewCell = arrayOfBoradCastTableViewCell;
    }

    [_collectionOfBoradCast reloadData];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_BoradCastCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfBoradCast" forIndexPath:indexPath];
    
    if (_arrayOfBoradCastTableViewCell.count != 0) {
        
            LJ_BoradCastModel *model = _arrayOfBoradCastTableViewCell[indexPath.item];
            cell.modelOfBroadCast = model;

    }

    return cell;
    
}


@end
