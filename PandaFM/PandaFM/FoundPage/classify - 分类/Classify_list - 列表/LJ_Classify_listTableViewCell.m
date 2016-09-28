//
//  LJ_Classify_listTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Classify_listTableViewCell.h"
#import "Divider_View.h"

@interface LJ_Classify_listTableViewCell ()
<UICollectionViewDataSource,
UICollectionViewDelegate
>
@property (nonatomic, strong) UICollectionView *collectionOfClassify;

@end

@implementation LJ_Classify_listTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
       
        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 2, 40);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 5;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionOfClassify = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 414, 150) collectionViewLayout:FlowLayout];
        _collectionOfClassify.backgroundColor = [UIColor whiteColor];
        
        _collectionOfClassify.pagingEnabled = YES;
        _collectionOfClassify.delegate = self;
        _collectionOfClassify.dataSource = self;
        [self addSubview:_collectionOfClassify];
        self.collectionOfClassify.scrollEnabled = NO;
         Divider_View *divider = [[Divider_View alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 10)];
        [_collectionOfClassify addSubview:divider];
        [_collectionOfClassify registerClass:[LJ_Classify_ListCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfClassify"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)setArrayOfClassify:(NSMutableArray *)arrayOfClassify {
    if (_arrayOfClassify != arrayOfClassify) {
        _arrayOfClassify = arrayOfClassify;
    }

    [_collectionOfClassify reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *array = _arrayOfClassify[1];
    return array.count - 1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_Classify_ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfClassify" forIndexPath:indexPath];
    NSMutableArray *array = _arrayOfClassify[1];
    NSInteger numebr = (array.count - 1) / 6;
//    NSInteger cont = (array.count - 1) % 6;
    if (indexPath.row < numebr * 6) {
    LJ_Classify_ListModel *model = [array objectAtIndex:indexPath.item + 1 + _numIndexPath * 6];
     cell.modelOfClassify = model;
    } else {
        LJ_Classify_ListModel *model = [array objectAtIndex:numebr * 6 + _numIndexPath];
        cell.modelOfClassify = model;
    }
   
    
    return cell;
}



@end
