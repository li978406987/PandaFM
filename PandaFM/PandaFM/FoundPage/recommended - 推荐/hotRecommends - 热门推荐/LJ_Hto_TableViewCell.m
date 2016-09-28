//
//  LJ_Hto_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Hto_TableViewCell.h"

@interface LJ_Hto_TableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, strong) UICollectionView *collectionViewOfHot;



@end
@implementation LJ_Hto_TableViewCell

#pragma mark - 热门推荐
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 2.5, 100);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 0;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfHot = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 414, 200) collectionViewLayout:FlowLayout];
        _collectionViewOfHot.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfHot.pagingEnabled = YES;
        _collectionViewOfHot.delegate = self;
        _collectionViewOfHot.dataSource = self;
        [self addSubview:_collectionViewOfHot];
        self.collectionViewOfHot.scrollEnabled = NO;
        
        
        [_collectionViewOfHot registerClass:[LJ_HotCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfHot"];
        
        
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    

}

- (void)setList:(List *)list {
    _list = list;
    self.arrayOfHot = [NSMutableArray arrayWithArray:_list.list];
    [self.collectionViewOfHot reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayOfHot.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_HotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfHot" forIndexPath:indexPath];
    
    LJ_HotRecommendsModel *model = [self.arrayOfHot objectAtIndex:indexPath.row];
    cell.modelOfHot = model;
    
    return cell;
}

- (void)setModelOfHotRecommends:(LJ_HotRecommendsModel *)modelOfHotRecommends {
    if (_modelOfHotRecommends != modelOfHotRecommends) {
        _modelOfHotRecommends = modelOfHotRecommends;
    }
    
}


@end
