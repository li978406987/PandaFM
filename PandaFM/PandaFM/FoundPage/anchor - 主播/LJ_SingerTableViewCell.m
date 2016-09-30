//
//  LJ_SingerTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/28.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_SingerTableViewCell.h"
static NSString *const cellIdentifier = @"cellOfSinger";
@interface LJ_SingerTableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectionViewOfSinger;

@end

@implementation LJ_SingerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, LJScreenH / 6);
        
        FlowLayout.minimumInteritemSpacing = 0;
        FlowLayout.minimumLineSpacing = 0;
        
//        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfSinger= [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _collectionViewOfSinger.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfSinger.pagingEnabled = YES;
        _collectionViewOfSinger.delegate = self;
        _collectionViewOfSinger.dataSource = self;
        [self.contentView addSubview:_collectionViewOfSinger];
        self.collectionViewOfSinger.scrollEnabled = NO;
        
        
        [_collectionViewOfSinger registerClass:[LJ_SingerCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    }
    return self;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionViewOfSinger.frame = self.contentView.bounds;
    
    
}

- (void)setArrayOfSinger:(NSMutableArray *)arrayOfSinger{
    
    if (_arrayOfSinger != arrayOfSinger) {
        _arrayOfSinger = arrayOfSinger;
    }

    [self.collectionViewOfSinger reloadData];
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return _arrayOfSinger.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_AnchorCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    LJ_AnchorModel *model = _arrayOfSinger[indexPath.row];
    
    cell.modelOfAnchor = model;
    
    
    return cell;
}

@end
