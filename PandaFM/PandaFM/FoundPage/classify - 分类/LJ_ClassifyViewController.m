//
//  LJ_ClassifyViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/30.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_ClassifyViewController.h"
#import "CollectionViewOfFirst_CollectionViewCell.h"
#import "LJ_KeywordsModel.h"


@interface LJ_ClassifyViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>


@property (nonatomic, strong) UICollectionView *collectionViewOfFirst;

@property (nonatomic ,strong) UICollectionView *collectionViewOfHorizontal;
//导航栏数组
@property (nonatomic, strong) NSMutableArray *arrayOfFirst;



@property (nonatomic, assign) NSInteger number;

@end


@implementation LJ_ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self handleDataOfCategoryInfo];
    

}

- (void)handleDataOfCategoryInfo {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?categoryId=33&device=iPhone&statEvent=pageview%2Fcategory%40%E4%BB%98%E8%B4%B9%E7%B2%BE%E5%93%81&statModule=%E4%BB%98%E8%B4%B9%E7%B2%BE%E5%93%81&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB";
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        NSDictionary *dictionary = (NSDictionary *)result;
        NSMutableArray *array = [dictionary objectForKey:@"keywords"];
       
        for (NSDictionary *dic in array) {
            LJ_KeywordsModel *model = [[LJ_KeywordsModel alloc] initWithDic:dic];
            [self.arrayOfFirst addObject:model];
        }
 
        [self.collectionViewOfFirst reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 创建导航栏Collectionview
- (void)creatCollectionView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.collectionViewOfFirst = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, LJScreenH * 0.068) collectionViewLayout:flowLayout];
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width / 5, _collectionViewOfFirst.frame.size.height);
    
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionViewOfFirst.delegate = self;
    _collectionViewOfFirst.dataSource = self;
    
    
    _collectionViewOfFirst.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
    
    [self.view addSubview:_collectionViewOfFirst];
    
    [_collectionViewOfFirst registerClass:[CollectionViewOfFirst_CollectionViewCell class] forCellWithReuseIdentifier:@"cellOfFirst"];
}

#pragma mark - 创建主界面Collectionview
- (void)creatHorizontalcollectionView {
    UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
    FlowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - 49);
    FlowLayout.minimumLineSpacing = 0;
    FlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionViewOfHorizontal = [[UICollectionView alloc] initWithFrame:CGRectMake(0, LJScreenH * 0.068, self.view.frame.size.width, self.view.frame.size.height - LJScreenH * 0.068) collectionViewLayout:FlowLayout];
    _collectionViewOfHorizontal.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionViewOfHorizontal];
    
    _collectionViewOfHorizontal.delegate = self;
    _collectionViewOfHorizontal.dataSource = self;
    _collectionViewOfHorizontal.pagingEnabled = YES;
    
    
//    [_collectionViewOfHorizontal registerClass:[Horizontal_CollectionViewCell class] forCellWithReuseIdentifier:@"cellOfHorizontal"];
    [_collectionViewOfHorizontal registerClass:[ClassifyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
//    [_collectionViewOfHorizontal registerClass:[ListCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfList"];
//    [_collectionViewOfHorizontal registerClass:[BorasCastCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfBoradCast"];
//    [_collectionViewOfHorizontal registerClass:[AnchorCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfAnchor"];
    
}


#pragma mark - 导航栏CollectionView的单元格个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _arrayOfFirst.count;
}

#pragma mark - 自定义cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    if (collectionView == _collectionViewOfFirst) {
        CollectionViewOfFirst_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfFirst" forIndexPath:indexPath];
        
        cell.modelOfFirst = _arrayOfFirst[indexPath.item];
        
        return cell;

    
    }
    return nil;
    
    
    
}





#pragma mark - 点击导航栏 轮动
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (collectionView == _collectionViewOfFirst) {
//        
//        CollectionViewOfFirst_CollectionViewCell *cell = (CollectionViewOfFirst_CollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_number inSection:0]];
//        
//        [cell setIsSeleted:YES];
//        
//        CollectionViewOfFirst_CollectionViewCell *cellOfTwo = (CollectionViewOfFirst_CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        [cellOfTwo setIsSeleted:NO];
//        _number = indexPath.item;
//        
//        _collectionViewOfHorizontal.contentOffset = CGPointMake(self.view.frame.size.width * _number, 0);
//        
//    }
//}
//
//#pragma mark - 滑动视图 轮动
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    if (scrollView == _collectionViewOfHorizontal) {
//        [_collectionViewOfFirst setContentOffset:CGPointMake(scrollView.contentOffset.x / self.view.frame.size.width, 0)];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.contentOffset.x / self.view.frame.size.width  inSection:0];
//        
//        CollectionViewOfFirst_CollectionViewCell *cell = (CollectionViewOfFirst_CollectionViewCell *)[_collectionViewOfFirst cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_number inSection:0]];
//        [cell setIsSeleted:YES];
//        
//        CollectionViewOfFirst_CollectionViewCell *cellOfTwo = (CollectionViewOfFirst_CollectionViewCell *)[_collectionViewOfFirst cellForItemAtIndexPath:indexPath];
//        [cellOfTwo setIsSeleted:NO];
//        _number = indexPath.item;
//        
//        _collectionViewOfHorizontal.contentOffset = CGPointMake(self.view.frame.size.width * _number, 0);
//        
//    }
//}
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
