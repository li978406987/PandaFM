//
//  LJ_CollectionView.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_CollectionView.h"
#import "Shuffly_Model.h"
#import "Shuffly_CollectionViewCell.h"

@interface LJ_CollectionView ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, retain) NSArray *picArr;
@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, retain) NSTimer *timer;
@property (nonatomic, assign) CGFloat autoTimerInterval;
@property (nonatomic, assign) BOOL isUrl;



@end

@implementation LJ_CollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
        [self createView];
        [self setTimer];
        self.isUrl = YES;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup {
    self = [super initWithFrame:frame];
    if (self) {
        _isUrl = NO;
        [self initialization];
        [self setImageArr:imagesGroup];
        [self createView];
        [self setTimer];
 
        
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame imagesURLStringGroup:(NSArray *)imageURLStringsGroup {
    self = [super initWithFrame:frame];
    if (self) {
        _isUrl = YES;
        [self initialization];
        [self setImageArr:imageURLStringsGroup];
        [self createView];
        [self setTimer];
    
    }
    return self;
}

- (void)initialization {
    _timerInterval = 2.0;
    _showPageControl = YES;
    _autoScroll = YES;
    
}



#pragma mark - picArr
- (void)setImageArr:(NSArray *)images {
    NSMutableArray *temp = [NSMutableArray arrayWithArray:images];
    [temp addObject:[images firstObject]];
    [temp insertObject:[images lastObject] atIndex:0];
    self.picArr = temp;
}
#pragma mark - 创建视图
- (void)createView {
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(width, height);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, width, height) collectionViewLayout:layout];
    [self addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    //显示水平滚动条
    _collectionView.showsHorizontalScrollIndicator = YES;
    [_collectionView registerClass:[Shuffly_CollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.pagingEnabled = YES;
    [_collectionView setContentOffset:CGPointMake(width, 0)];

}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark- 定时器
- (void)setTimer {
    _timer = [NSTimer scheduledTimerWithTimeInterval:_timerInterval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:_timer forMode:NSRunLoopCommonModes];
}


#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_autoScroll) {
        [_timer invalidate];
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timerInterval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;
    if (point.x == 0) {
        [scrollView setContentOffset:CGPointMake(self.frame.size.width * (_picArr.count - 2), 0)];
    } else if (point.x == self.frame.size.width * (_picArr.count - 1)) {
        [scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
    }
}

#pragma mark - collectionViewDelegate&DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _picArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Shuffly_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];

    if (_isUrl) {
        Shuffly_Model *model = _picArr[indexPath.row];
        
        cell.modelOfShuffly = model;
    } else {
        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_picArr[indexPath.row]]];
    }

//    cell.layer.cornerRadius = 50;
    return cell;
}
#pragma mark - 切图
- (void)nextPage {
    if (_autoScroll) {
        [_collectionView setContentOffset:CGPointMake(_collectionView.contentOffset.x + self.frame.size.width, 0) animated:YES];

    }
}

- (void)setTimerInterval:(CGFloat)timerInterval {
    _timerInterval = timerInterval;
    [self setTimer];
}
- (void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
}


- (void)setImageURLStringsGroup:(NSArray *)imageURLStringsGroup {
    if (_imageURLStringsGroup != imageURLStringsGroup) {

        _imageURLStringsGroup = imageURLStringsGroup;
    }
    [self setImageArr:self.imageURLStringsGroup];
    [self.collectionView reloadData];
}




@end
