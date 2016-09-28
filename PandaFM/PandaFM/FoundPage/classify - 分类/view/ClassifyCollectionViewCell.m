//
//  ClassifyCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "ClassifyCollectionViewCell.h"

@interface ClassifyCollectionViewCell ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionViewFindingNovel;

@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation ClassifyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH - 50 - 64) style:UITableViewStylePlain];
        [self.contentView addSubview:_tableView];
        _tableView.rowHeight = 150;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *viewOfHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH / 5 * 2)];
        _tableView.tableHeaderView = viewOfHeader;
        viewOfHeader.backgroundColor = [UIColor grayColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewOfHeader.frame.size.width, viewOfHeader.frame.size.height / 3 * 2)];
    
        [viewOfHeader addSubview:_imageView];
        
#pragma mark - 轮播图下方collectionView
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 4.5, 90);
        
        FlowLayout.minimumInteritemSpacing = 0;
        FlowLayout.minimumLineSpacing = 0;
        
        FlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.collectionViewFindingNovel = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _imageView.frame.size.height, self.frame.size.width, viewOfHeader.frame.size.height - _imageView.frame.size.height) collectionViewLayout:FlowLayout];
        _collectionViewFindingNovel.backgroundColor = [UIColor whiteColor];
        
        _collectionViewFindingNovel.pagingEnabled = YES;
        _collectionViewFindingNovel.delegate = self;
        _collectionViewFindingNovel.dataSource = self;
        
        [viewOfHeader addSubview:_collectionViewFindingNovel];
        
        //注册collectionView的cell
        [_collectionViewFindingNovel registerClass:[Classify_FindingNovelCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfFindingNovel"];
        //注册TableView的cell
        [_tableView registerClass:[LJ_Classify_listTableViewCell class] forCellReuseIdentifier:@"cellOfClassify"];
        
       
    }
    return self;
}

- (void)setArrayOfFindingNovel:(NSMutableArray *)arrayOfFindingNovel {
    if (_arrayOfFindingNovel != arrayOfFindingNovel) {
        _arrayOfFindingNovel = arrayOfFindingNovel;
    }
    [self.tableView reloadData];
     LJ_ClassifyModel *model = [_arrayOfFindingNovel[1] objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:model.coverPath];
    [_imageView sd_setImageWithURL:url];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number = [_arrayOfFindingNovel[1] count] / 6;
    NSInteger floatOfNumber = 0;
    if ([_arrayOfFindingNovel[1] count] % 6 > 0) {
        floatOfNumber = 1;
    } else {
        floatOfNumber = 0;
    }
    
    return number + floatOfNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJ_Classify_listTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfClassify" forIndexPath:indexPath];

    cell.arrayOfClassify = _arrayOfFindingNovel;
    cell.numIndexPath = indexPath.row;

    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    Classify_discoveryColumns *disc = _arrayOfFindingNovel[0];

    return disc.list.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Classify_FindingNovelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfFindingNovel" forIndexPath:indexPath];
    Classify_discoveryColumns *disc = _arrayOfFindingNovel[0];
    LJ_ClassifyModel *model = [disc.list objectAtIndex:indexPath.row];
    cell.modelOfClassify_Finding = model;
    return cell;
}




@end
