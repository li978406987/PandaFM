//
//  LJ_CityColumn_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_CityColumn_TableViewCell.h"

@interface LJ_CityColumn_TableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, strong) UICollectionView *collectionViewOfCityColumn;

@end

@implementation LJ_CityColumn_TableViewCell


#pragma mark - 听大连
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 2.5, 100);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 0;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfCityColumn = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 414, 200) collectionViewLayout:FlowLayout];
        _collectionViewOfCityColumn.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfCityColumn.pagingEnabled = YES;
        _collectionViewOfCityColumn.delegate = self;
        _collectionViewOfCityColumn.dataSource = self;
        [self addSubview:_collectionViewOfCityColumn];
        self.collectionViewOfCityColumn.scrollEnabled = NO;
        
        
        [_collectionViewOfCityColumn registerClass:[LJ_CityColumnCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfCityColumn"];
       
      
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)setArrayOfCityColumn:(NSMutableArray *)arrayOfCityColumn {
    if (_arrayOfCityColumn != arrayOfCityColumn) {
        _arrayOfCityColumn = arrayOfCityColumn;
        
    }
    [_collectionViewOfCityColumn reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayOfCityColumn.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_CityColumnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfCityColumn" forIndexPath:indexPath];
    
    LJ_CityColumnModel *model = [self.arrayOfCityColumn objectAtIndex:indexPath.row];
    
    cell.modelOfCityColumn = model;
    
    return cell;
}





@end
