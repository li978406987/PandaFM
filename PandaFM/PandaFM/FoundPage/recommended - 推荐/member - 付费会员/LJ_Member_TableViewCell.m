//
//  LJ_Member_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Member_TableViewCell.h"

@interface LJ_Member_TableViewCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, strong) UICollectionView *collectionViewOfMember;


@end

@implementation LJ_Member_TableViewCell

#pragma mark - 听大连
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.contentView.frame.size.width / 2.5, self.contentView.frame.size.height / 2);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 0;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfMember = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _collectionViewOfMember.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfMember.pagingEnabled = YES;
        _collectionViewOfMember.delegate = self;
        _collectionViewOfMember.dataSource = self;
        [self addSubview:_collectionViewOfMember];
        self.collectionViewOfMember.scrollEnabled = NO;
        
        
        [_collectionViewOfMember registerClass:[LJ_MemberCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfMember"];
        
        
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionViewOfMember.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)setArrayOfMember:(NSMutableArray *)arrayOfMember {
    if (_arrayOfMember != arrayOfMember) {
        _arrayOfMember = arrayOfMember;
    }
    [_collectionViewOfMember reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayOfMember.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_MemberCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfMember" forIndexPath:indexPath];
    
    LJ_MemberModel *model = [self.arrayOfMember objectAtIndex:indexPath.row];
    cell.modelOfMember = model;
    
    return cell;
}


@end
