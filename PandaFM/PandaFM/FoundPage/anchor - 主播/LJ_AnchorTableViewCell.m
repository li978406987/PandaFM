//
//  LJ_AnchorTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_AnchorTableViewCell.h"

static NSString *const cellIdentifier = @"cellOfAnchor";

@interface LJ_AnchorTableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectionViewOfAnchor;



@end

@implementation LJ_AnchorTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3.5, 170);
        
        FlowLayout.minimumInteritemSpacing = 0;
        FlowLayout.minimumLineSpacing = 10;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfAnchor= [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _collectionViewOfAnchor.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfAnchor.pagingEnabled = YES;
        _collectionViewOfAnchor.delegate = self;
        _collectionViewOfAnchor.dataSource = self;
        [self.contentView addSubview:_collectionViewOfAnchor];
        self.collectionViewOfAnchor.scrollEnabled = NO;
        
        
        [_collectionViewOfAnchor registerClass:[LJ_AnchorCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    }
    return self;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionViewOfAnchor.frame = self.contentView.bounds;

    
}

- (void)setArrayOfAnchor:(NSMutableArray *)arrayOfAnchor {
    if (_arrayOfAnchor != arrayOfAnchor) {
        _arrayOfAnchor = arrayOfAnchor;
    }
    [self.collectionViewOfAnchor reloadData];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {


    return _arrayOfAnchor.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_AnchorCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];


    LJ_AnchorModel *model = _arrayOfAnchor[indexPath.row];

    cell.modelOfAnchor = model;


    return cell;
}



@end
