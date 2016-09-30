//
//  Horizontal_CollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Horizontal_CollectionViewCell.h"
#import "Shuffly_CollectionViewCell.h"
#import "Shuffly_Model.h"
#import "LJ_CollectionView.h"
#import "FindingNovel_CollectionViewCell.h"
#import "FindingNovel_Model.h"

#import "LJ_GuessCollectionViewCell.h"
#import "LJ_GuessModel.h"
#import "LJ_Guess_TableViewCell.h"

#import "Divider_View.h"

#import "LJ_FoundViewController.h"


@interface Horizontal_CollectionViewCell ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource,
UIScrollViewDelegate
>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionViewFindingNovel;

@property (nonatomic, strong) LJ_CollectionView *collectionView;




@end

@implementation Horizontal_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.contentView addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.91f alpha:1.00f];
        UIView *viewOfHeader = [[UIView alloc] init];
        viewOfHeader.frame = CGRectMake(0, 0, _tableView.frame.size.width, 330);
        _tableView.tableHeaderView = viewOfHeader;
        Divider_View *divider = [[Divider_View alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 20)];
        [viewOfHeader addSubview:divider];
        
        
        self.collectionView = [[LJ_CollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 220)];
        [viewOfHeader addSubview:_collectionView];
        self.collectionView.showPageControl = NO;
        
        
        [self creatCollectionViewOfFindingNovel];
        
        [viewOfHeader addSubview:_collectionViewFindingNovel];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        //猜你喜欢
        [_tableView registerClass:[LJ_Guess_TableViewCell class] forCellReuseIdentifier:@"cellOfGuess"];
        //听大连
        [_tableView registerClass:[LJ_CityColumn_TableViewCell class] forCellReuseIdentifier:@"cellOfCityColumn"];
        //付费会员
        [_tableView registerClass:[LJ_Member_TableViewCell class] forCellReuseIdentifier:@"cellOfMember"];
        //付费会员
        [_tableView registerClass:[LJ_Hto_TableViewCell class] forCellReuseIdentifier:@"cellOfPayFine"];
        
        //热门推荐
        [_tableView registerClass:[LJ_Hto_TableViewCell class] forCellReuseIdentifier:@"cellOfHot"];
        
        //小编推荐
        [_tableView registerClass:[LJ_Editor_TableViewCell class] forCellReuseIdentifier:@"cellOfEditor"];
        
        //精品听单
        [_tableView registerClass:[LJ_SpecialColumn_TableViewCell class] forCellReuseIdentifier:@"cellOfSpecial"];
        
        
        
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(UP)];

        
    }
    return self;
}

- (void)UP {
    [self.delegate UPDataOfHorizontal];
    [_tableView.mj_header endRefreshing];

}




- (void)setArrayOfOther:(NSMutableArray *)arrayOfOther {
    if (_arrayOfOther != arrayOfOther) {
        _arrayOfOther = arrayOfOther;
    }
    
    [_tableView reloadData];
    if (_arrayOfOther.count != 0){
    Shuffly *shuffly = _arrayOfOther[0];
    
    self.collectionView.imageURLStringsGroup = shuffly.list;
    }

}



- (void)setArrayOfAll:(NSMutableArray *)arrayOfAll {
    if (_arrayOfAll != arrayOfAll) {
        _arrayOfAll = arrayOfAll;
    }
    
    [self.collectionViewFindingNovel reloadData];
    [_tableView reloadData];

}


//- (void)setArrayOfFindNovel:(NSMutableArray *)arrayOfFindNovel {
//   
//    if (_arrayOfFindNovel != arrayOfFindNovel) {
//        _arrayOfFindNovel = arrayOfFindNovel;
//    }
//    [self.collectionViewFindingNovel reloadData];
//    
//}
//
//- (void)setArrayOfGuess:(NSMutableArray *)arrayOfGuess {
//    if (_arrayOfGuess != arrayOfGuess) {
//        _arrayOfGuess = arrayOfGuess;
//    }
//    [self.collectionViewFindingNovel reloadData];
//    NSLog(@"哈哈哈哈%ld", arrayOfGuess.count);
//}




- (void)layoutSubviews {
    [super layoutSubviews];
    
    _tableView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height - 64);
    
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 450;
    }
     
    return 200;
}

//分区内cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}
//分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
       return _arrayOfAll.count + 1;
}

//头视图高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}



//头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH * 0.03)];

    view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageviewOflive = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"liveRadioCellPoint@2x"]];
    imageviewOflive.frame = CGRectMake(20, 20, 20, 20);
    [view addSubview:imageviewOflive];
    UILabel *labelOfTitle = [[UILabel alloc] initWithFrame:CGRectMake(45, 20, 100, 20)];
    [view addSubview:labelOfTitle];
    
    if (section == 0) {
        Guess *guess = _arrayOfAll[section + 1];
        labelOfTitle.text = guess.title;
    }
    if (section == 1) {
        EditorRecommendAlbums *editor = _arrayOfOther[section];
        labelOfTitle.text = editor.title;
    }
    if (section == 2) {
        CityColumn *cityColumn = _arrayOfAll[section];
        labelOfTitle.text = cityColumn.title;
    }
    if (section == 3) {
        SpecialColumn *specoal = _arrayOfOther[section - 1];
        labelOfTitle.text = specoal.title;
    }
    if (section == 4) {
        List *list = _arrayOfAll[section];
        labelOfTitle.text = list.title;
    }
    if (section == 5) {
        Member *member = _arrayOfAll[section - 2];
        labelOfTitle.text = member.title;

    }
    if (section > 5) {
        List *list = _arrayOfAll[section - 1];
        labelOfTitle.text = list.title;

    }

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(330, 20, 70, 25);

    [button setTitle:@"更多 >" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return view;
}

- (void)buttonAction:(UIButton *)button {
    LJ_Found_DetailsViewController *found_Details = [[LJ_Found_DetailsViewController alloc] init];

     EditorRecommendAlbums *editor = _arrayOfOther[1];
    found_Details.titleOfNavi = editor.title;

    [[self naviController] pushViewController:found_Details animated:YES];
}
//当前控制器的导航控制器
- (UINavigationController*)naviController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            
            return (UINavigationController*)nextResponder;
        }
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        LJ_Guess_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfGuess" forIndexPath:indexPath];
        Guess *guess = [self.arrayOfAll objectAtIndex:indexPath.section + 1];
        
        cell.arrayOfGuess = guess.list;
        return cell;
    } if (indexPath.section == 1) {
        LJ_Editor_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfEditor" forIndexPath:indexPath];
        EditorRecommendAlbums *editor = _arrayOfOther[indexPath.section];
        
        cell.arrayOfEditor = editor.list;
        return cell;
    }
    
    if (indexPath.section == 2) {
        LJ_CityColumn_TableViewCell *cellOfCityColumn = [tableView dequeueReusableCellWithIdentifier:@"cellOfCityColumn" forIndexPath:indexPath];
        CityColumn *cityColimn = _arrayOfAll[indexPath.section];
        cellOfCityColumn.arrayOfCityColumn = cityColimn.list;

        return cellOfCityColumn;
    }
    if (indexPath.section == 3) {
        LJ_SpecialColumn_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfSpecial" forIndexPath:indexPath];
        SpecialColumn *special = _arrayOfOther[indexPath.section - 1];
        cell.arrayOfSpecial = special.list;
        return cell;
    }
    
    if (indexPath.section == 4) {
        LJ_Hto_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfPayFine" forIndexPath:indexPath];
        
        List *list = _arrayOfAll[indexPath.section];
        cell.arrayOfHot = list.list;
        
        return cell;
    }
    if (indexPath.section == 5) {
       LJ_Member_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfMember" forIndexPath:indexPath];
        Member *member = _arrayOfAll [indexPath.section - 2];
        cell.arrayOfMember = member.list;
        return cell;
    }

    LJ_Hto_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfHot" forIndexPath:indexPath];

    List *list = _arrayOfAll[indexPath.section - 1];

    cell.list = list;
    
    return cell;
}

#pragma mark - 轮播图下方collectionView
- (void) creatCollectionViewOfFindingNovel {
    UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 4.5, 90);
    
    FlowLayout.minimumInteritemSpacing = 0;
    FlowLayout.minimumLineSpacing = 0;
    
    FlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionViewFindingNovel = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 220, self.frame.size.width, 90) collectionViewLayout:FlowLayout];
    _collectionViewFindingNovel.backgroundColor = [UIColor whiteColor];

    _collectionViewFindingNovel.pagingEnabled = YES;
    _collectionViewFindingNovel.delegate = self;
    _collectionViewFindingNovel.dataSource = self;

    
    [_collectionViewFindingNovel registerClass:[FindingNovel_CollectionViewCell class] forCellWithReuseIdentifier:@"cellOfFindingNovel"];
    
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FindingNovel_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfFindingNovel" forIndexPath:indexPath];
    DiscoveryColumns *disc = [self.arrayOfAll objectAtIndex:indexPath.section];
    FindingNovel_Model *model = [disc.list objectAtIndex:indexPath.row];
    cell.modelOfFindingNovel = model;
    return cell;
}





@end
