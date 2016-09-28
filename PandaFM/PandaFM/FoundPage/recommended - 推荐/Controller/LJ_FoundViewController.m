//
//  LJ_FoundViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/20.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_FoundViewController.h"
//导航栏collectionView的model
#import "CollectionViewOfFirst_Model.h"
//导航栏collectionView的cell
#import "CollectionViewOfFirst_CollectionViewCell.h"
//(推荐)横向滚动的collectionView的cell
#import "Horizontal_CollectionViewCell.h"

//(分类)横向滚动的collectionView的cell
#import "ClassifyCollectionViewCell.h"

//(榜单)横向滚动的collectionView的cell
#import "ListCollectionViewCell.h"

//(主播)横向滚动的collectionView的cell
#import "AnchorCollectionViewCell.h"

@interface LJ_FoundViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>
//导航栏collectionView
@property (nonatomic, strong) UICollectionView *collectionViewOfFirst;

@property (nonatomic ,strong) UICollectionView *collectionViewOfHorizontal;
//导航栏collectionView的数组
@property (nonatomic, strong) NSMutableArray *arrayOfFirst;

@property (nonatomic, strong) UITableView *tableviewOffound;

@property (nonatomic, assign) NSInteger number;
//小编推荐字典
@property (nonatomic, strong) NSMutableArray *arrayOfeditorRecommendAlbums;
////轮播图字典
@property (nonatomic, strong) NSMutableArray *arrayOffocusImages;
////精品听单字典
@property (nonatomic, strong) NSMutableArray *arrayOfOther;
//发现新奇
@property (nonatomic, strong) NSMutableArray *arrayOfAll;
//分类页面数据数组
@property (nonatomic, strong) NSMutableArray *arrayOfClassify_DiscoveryColumns;
//榜单页面数据数组
@property (nonatomic, strong) NSMutableArray *arrayOfList_Datas;

//榜单页面 焦点图数组
@property (nonatomic, strong) NSMutableArray *arrayOfList_FocusImages;
//主播页面数组
@property (nonatomic, strong) NSMutableArray *arrayOfAnchor;

@end

@implementation LJ_FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfFirst = [NSMutableArray array];
    self.arrayOfeditorRecommendAlbums = [NSMutableArray array];
    self.arrayOffocusImages = [NSMutableArray array];
    self.arrayOfOther = [NSMutableArray array];
    self.arrayOfClassify_DiscoveryColumns = [NSMutableArray array];
    self.arrayOfList_Datas = [NSMutableArray array];
    self.arrayOfList_FocusImages = [NSMutableArray array];
    self.arrayOfAnchor = [NSMutableArray array];
    
    [self config];
    
//    self.arrayOfAll = [NSMutableArray array];
    [self handleData];
    
    [self handleDataOfCollectionViewFirst];
    [self handleDataOfshufflyAndSmallMakeUpRecommendAndHighqualityGoodsToSingle];
    [self handleDataClassification];
    [self handleDataOFList_Datas];
    [self handleDataOfAnchor];
    
    [self creatCollectionView];
    [self creatHorizontalcollectionView];
    
}
#pragma mark - 配置
- (void) config {
    
    
   
    
    //    NSArray *familyNames = [UIFont familyNames];
    //
    //    for (NSString *str in familyNames) {
    //
    //        NSLog(@"字体名字:%@, 个数:%ld", str, familyNames.count);
    //    }
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"熊猫FM";
//    
//    label.textAlignment = 1;
//    
//    label.font = [UIFont fontWithName:@"HuJingLi-Mao" size:25];
//    self.navigationItem.title = label.text;

    
}

#pragma mark - 导航栏collectionView数据解析
- (void) handleDataOfCollectionViewFirst {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=iPhone";
    
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
      
        NSDictionary *dictionary = (NSDictionary *)result;
        NSDictionary *tabs = [dictionary objectForKey:@"tabs"];
        NSArray *list = [tabs objectForKey:@"list"];
        for (NSDictionary *dic in list) {
            CollectionViewOfFirst_Model *first = [[CollectionViewOfFirst_Model alloc] initWithDic:dic];
            [self.arrayOfFirst addObject:first];

        }
        [self.collectionViewOfFirst reloadData];
        [self.collectionViewOfHorizontal reloadData];
    }failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 轮播图 - 小编推荐 - 精品听单 数据
- (void) handleDataOfshufflyAndSmallMakeUpRecommendAndHighqualityGoodsToSingle {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.33";

    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
     
        NSDictionary *dictionary = (NSDictionary *)result;
        //轮播图
        NSDictionary *focusImages = [dictionary objectForKey:@"focusImages"];
        Shuffly *dicShuffly = [[Shuffly alloc] init];
        [dicShuffly setValuesForKeysWithDictionary:focusImages];
        
        //小编推荐
        NSDictionary *editorRecommendAlbums = [dictionary objectForKey:@"editorRecommendAlbums"];
        EditorRecommendAlbums *dicOfEditor = [[EditorRecommendAlbums alloc] init];
        [dicOfEditor setValuesForKeysWithDictionary:editorRecommendAlbums];
        //精品听单
        NSDictionary *specialColumn = [dictionary objectForKey:@"specialColumn"];
        SpecialColumn *dicOfSpecial = [[SpecialColumn alloc] init];
        [dicOfSpecial setValuesForKeysWithDictionary:specialColumn];
        
        
        [self.arrayOfOther addObject:dicShuffly];
        [self.arrayOfOther addObject:dicOfEditor];
        [self.arrayOfOther addObject:dicOfSpecial];
        
        [_collectionViewOfHorizontal reloadData];
    }failure:^(NSError *error) {
        
    }];
    
}
#pragma mark - 发现新奇 - 付费会员 - 猜你喜欢 - 听大连 - 热门推荐(付费会员 ,听精品, 听小说等)
- (void) handleData {
    self.arrayOfAll = [NSMutableArray array];
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_210000_2102&device=iPhone&version=5.4.33";
    
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        
        NSDictionary *dictionary = (NSDictionary *)result;
        //发现新奇
        NSDictionary *discoveryColumns = dictionary[@"discoveryColumns"];
        DiscoveryColumns *disCoveruColu = [[DiscoveryColumns alloc] init];
        [disCoveruColu setValuesForKeysWithDictionary:discoveryColumns];
       
        //猜你喜欢
        NSDictionary *dicOfGuess = [dictionary objectForKey:@"guess"];
        Guess *guess = [[Guess alloc] init];
        [guess setValuesForKeysWithDictionary:dicOfGuess];
        
        //听大连
        NSDictionary *dicOfDaLian = [dictionary objectForKey:@"cityColumn"];
        CityColumn *cityColumn = [[CityColumn alloc] init];
        [cityColumn setValuesForKeysWithDictionary:dicOfDaLian];
        
        //付费会员
        NSDictionary *dicOfMember = [dictionary objectForKey:@"member"];
        Member *member = [[Member alloc] init];
        [member setValuesForKeysWithDictionary:dicOfMember];
        
        //热门推荐
        NSDictionary *dicOfHot = [dictionary objectForKey:@"hotRecommends"];
        hotRecommends *hotrecommends = [[hotRecommends alloc] init];
        [hotrecommends setValuesForKeysWithDictionary:dicOfHot];

        [self.arrayOfAll addObject:disCoveruColu];
        [self.arrayOfAll addObject:guess];
        [self.arrayOfAll addObject:cityColumn];
        [self.arrayOfAll addObject:member];
        
        for (List *list in hotrecommends.arrList) {
            [self.arrayOfAll addObject:list];
        }
        [_collectionViewOfHorizontal reloadData];
        
    }failure:^(NSError *error) {
        
        
    }];
   
}

#pragma mark - 分类页面数据

- (void) handleDataClassification {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&code=43_210000_2102&device=iPhone&picVersion=13&scale=2&version=5.4.33";
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        
        NSDictionary *dictionary = (NSDictionary *)result;
        //发现新奇
        NSDictionary *dicOfDiscoveryColumns = [dictionary objectForKey:@"discoveryColumns"];
        Classify_discoveryColumns *dicOfClassify = [[Classify_discoveryColumns alloc] init];
        [dicOfClassify setValuesForKeysWithDictionary:dicOfDiscoveryColumns];
        
        
        [self.arrayOfClassify_DiscoveryColumns addObject:dicOfClassify];
        
        //付费畅销榜
        NSMutableArray *arrayOfList = [dictionary objectForKey:@"list"];
        NSMutableArray *arrayOfModelList = [NSMutableArray array];
        for (NSDictionary *dic in arrayOfList) {
            LJ_ClassifyModel *model = [[LJ_ClassifyModel alloc] initWithDic:dic];
            [arrayOfModelList addObject:model];
        }

        [self.arrayOfClassify_DiscoveryColumns addObject:arrayOfModelList];
    } failure:^(NSError *error) {
        
    }];
}


#pragma mark - 榜单页面数据

- (void)handleDataOFList_Datas {
    
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.33";
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        NSDictionary *dictionary = (NSDictionary *)result;
        
        //节目榜单
        self.arrayOfList_Datas = [dictionary objectForKey:@"datas"];

        NSDictionary *focusImages = [dictionary objectForKey:@"focusImages"];
        self.arrayOfList_FocusImages = [focusImages objectForKey:@"list"];

    } failure:^(NSError *error) {
        
    }];
    
}

#pragma mark - 主播页面数据
- (void)handleDataOfAnchor {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/anchor/recommend?device=iPhone&version=5.4.33";
    
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        NSDictionary *dictionary = (NSDictionary *)result;
        
        NSMutableArray *arrayOffamous = [dictionary objectForKey:@"famous"];
        for (NSDictionary *dic in arrayOffamous) {
            Anchor *anchor = [[Anchor alloc] init];
            [anchor setValuesForKeysWithDictionary:dic];
            [self.arrayOfAnchor addObject:anchor];
        }
        NSMutableArray *arrayOfnormal = [dictionary objectForKey:@"normal"];
        for (NSDictionary *dic in arrayOfnormal) {
            Anchor *anchor = [[Anchor alloc] init];
            [anchor setValuesForKeysWithDictionary:dic];

            [self.arrayOfAnchor addObject:anchor];
        }
        
        NSDictionary *dic = [dictionary objectForKey:@"relation"];

        [self.arrayOfAnchor addObject:dic];


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
    FlowLayout.itemSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height - LJScreenH * 0.068);
    FlowLayout.minimumLineSpacing = 0;
    FlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionViewOfHorizontal = [[UICollectionView alloc] initWithFrame:CGRectMake(0, LJScreenH * 0.068, self.view.frame.size.width, self.view.frame.size.height - LJScreenH * 0.068) collectionViewLayout:FlowLayout];
    _collectionViewOfHorizontal.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionViewOfHorizontal];
    
    _collectionViewOfHorizontal.delegate = self;
    _collectionViewOfHorizontal.dataSource = self;
    _collectionViewOfHorizontal.pagingEnabled = YES;
    
    
    [_collectionViewOfHorizontal registerClass:[Horizontal_CollectionViewCell class] forCellWithReuseIdentifier:@"cellOfHorizontal"];
    [_collectionViewOfHorizontal registerClass:[ClassifyCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfClassify"];
    [_collectionViewOfHorizontal registerClass:[ListCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfList"];
    [_collectionViewOfHorizontal registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell3"];
    [_collectionViewOfHorizontal registerClass:[AnchorCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfAnchor"];
    
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
    if (indexPath.item == 0) {
        Horizontal_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfHorizontal" forIndexPath:indexPath];

        if (self.arrayOfAll.count != 0) {

            cell.arrayOfOther = _arrayOfOther;
            cell.arrayOfAll = _arrayOfAll;
        }
    
        return cell;
    }
    if (indexPath.item == 1) {
        ClassifyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfClassify" forIndexPath:indexPath];
        if (self.arrayOfClassify_DiscoveryColumns != 0) {
            cell.arrayOfFindingNovel = _arrayOfClassify_DiscoveryColumns;
        }
        cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
        return cell;
    }

        if (indexPath.item == 2) {
            ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfList" forIndexPath:indexPath];
            
            cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
            return cell;
        }

        if (indexPath.item == 3) {
           ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfList" forIndexPath:indexPath];
            
            cell.arrayOfDatas = _arrayOfList_Datas;
            cell.focusImages = _arrayOfList_FocusImages;
            return cell;
        }

         if (indexPath.item == 4) {
            AnchorCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfAnchor" forIndexPath:indexPath];
             cell.arrayOfAnchor = _arrayOfAnchor;
            
            return cell;
        }
    return nil;


 
}

#pragma mark - 点击导航栏 轮动
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collectionView == _collectionViewOfFirst) {
        
        CollectionViewOfFirst_CollectionViewCell *cell = (CollectionViewOfFirst_CollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_number inSection:0]];
        
        [cell setIsSeleted:YES];
        
        CollectionViewOfFirst_CollectionViewCell *cellOfTwo = (CollectionViewOfFirst_CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cellOfTwo setIsSeleted:NO];
        _number = indexPath.item;
        
        _collectionViewOfHorizontal.contentOffset = CGPointMake(self.view.frame.size.width * _number, 0);

    }
}

#pragma mark - 滑动视图 轮动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _collectionViewOfHorizontal) {
        [_collectionViewOfFirst setContentOffset:CGPointMake(scrollView.contentOffset.x / self.view.frame.size.width, 0)];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:scrollView.contentOffset.x / self.view.frame.size.width  inSection:0];
        
        CollectionViewOfFirst_CollectionViewCell *cell = (CollectionViewOfFirst_CollectionViewCell *)[_collectionViewOfFirst cellForItemAtIndexPath:[NSIndexPath indexPathForItem:_number inSection:0]];
        [cell setIsSeleted:YES];
        
        CollectionViewOfFirst_CollectionViewCell *cellOfTwo = (CollectionViewOfFirst_CollectionViewCell *)[_collectionViewOfFirst cellForItemAtIndexPath:indexPath];
        [cellOfTwo setIsSeleted:NO];
        _number = indexPath.item;
        
        _collectionViewOfHorizontal.contentOffset = CGPointMake(self.view.frame.size.width * _number, 0);
        
    }
}




@end
