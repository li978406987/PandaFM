//
//  LJ_Editor_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Editor_TableViewCell.h"

@interface LJ_Editor_TableViewCell ()

<
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic, strong) UICollectionView *collectionViewOfEditor;

@end

@implementation LJ_Editor_TableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.contentView.frame.size.width / 2.5, self.contentView.frame.size.height / 2);
        
        FlowLayout.minimumInteritemSpacing = 5;
        FlowLayout.minimumLineSpacing = 0;
        
        FlowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        FlowLayout.scrollDirection = NO;
        
        self.collectionViewOfEditor = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:FlowLayout];
        _collectionViewOfEditor.backgroundColor = [UIColor whiteColor];
        
        _collectionViewOfEditor.pagingEnabled = YES;
        _collectionViewOfEditor.delegate = self;
        _collectionViewOfEditor.dataSource = self;
        [self addSubview:_collectionViewOfEditor];
        self.collectionViewOfEditor.scrollEnabled = NO;
        
        
        [_collectionViewOfEditor registerClass:[LJ_Editor_CollectionViewCell class] forCellWithReuseIdentifier:@"cellOfEditor"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _collectionViewOfEditor.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)setArrayOfEditor:(NSMutableArray *)arrayOfEditor {
    if (_arrayOfEditor != arrayOfEditor) {
        _arrayOfEditor = arrayOfEditor;
    }

    [_collectionViewOfEditor reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayOfEditor.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_Editor_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfEditor" forIndexPath:indexPath];
    
    LJ_EditorModel *model = [self.arrayOfEditor objectAtIndex:indexPath.row];
    cell.modelOfEditor = model;
    
    return cell;
}


@end
