//
//  LJ_Guess_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/23.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Guess_TableViewCell.h"
#import "LJ_GuessCollectionViewCell.h"
#import "LJ_GuessModel.h"

@interface LJ_Guess_TableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectionViewOfGuess;

@end

@implementation LJ_Guess_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 2.7, 210);
        
        FlowLayout.minimumInteritemSpacing = 0;
        FlowLayout.minimumLineSpacing = 10;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfGuess = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 414 - 10, 450) collectionViewLayout:FlowLayout];
        _collectionViewOfGuess.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfGuess.pagingEnabled = YES;
        _collectionViewOfGuess.delegate = self;
        _collectionViewOfGuess.dataSource = self;
        [self addSubview:_collectionViewOfGuess];
        self.collectionViewOfGuess.scrollEnabled = NO;
        
        
        [_collectionViewOfGuess registerClass:[LJ_GuessCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfGuess"];
        
    }
    return self;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)setArrayOfGuess:(NSMutableArray *)arrayOfGuess {
    if (_arrayOfGuess != arrayOfGuess) {
        _arrayOfGuess = arrayOfGuess;
    }
    [self.collectionViewOfGuess reloadData];
}


#pragma mark - 猜你喜欢

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _arrayOfGuess.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_GuessCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfGuess" forIndexPath:indexPath];
    
    LJ_GuessModel *model = [self.arrayOfGuess objectAtIndex:indexPath.row];
    
    cell.modelOfGuess = model;
    
    return cell;
}








@end
