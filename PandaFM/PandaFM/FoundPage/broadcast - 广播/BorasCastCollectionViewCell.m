//
//  BorasCastCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "BorasCastCollectionViewCell.h"
#import "Divider_View.h"

@interface BorasCastCollectionViewCell ()
<
UITableViewDelegate,
UITableViewDataSource,
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UICollectionView *collectionViewCategories;


@end

@implementation BorasCastCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height - 74) style:UITableViewStyleGrouped];
        [self.contentView addSubview:_tableView];
        _tableView.rowHeight = 270;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *viewOfHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH / 3 * 1)];
        _tableView.tableHeaderView = viewOfHeader;
        

        //本地台
        UIButton *buttonOflocal = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonOflocal.frame = CGRectMake(0, 0, viewOfHeader.frame.size.width / 4, 90);
        [buttonOflocal setTitle:@"本地台" forState:UIControlStateNormal];
        [buttonOflocal setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonOflocal.titleEdgeInsets = UIEdgeInsetsMake(40, -19, 0, 0);
        buttonOflocal.imageEdgeInsets = UIEdgeInsetsMake(-25,29,0,0);
        
        [buttonOflocal setImage:[UIImage imageNamed:@"icon_radio_local"] forState:UIControlStateNormal];
        [viewOfHeader addSubview:buttonOflocal];
        [buttonOflocal addTarget:self action:@selector(buttonOflocalAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //国家台
        UIButton *buttonOfcountry = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonOfcountry.frame = CGRectMake(viewOfHeader.frame.size.width / 4, 0, viewOfHeader.frame.size.width / 4, 90);
        [buttonOfcountry setTitle:@"国家台" forState:UIControlStateNormal];
        [buttonOfcountry setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonOfcountry.titleEdgeInsets = UIEdgeInsetsMake(40, -19, 0, 0);
        
        buttonOfcountry.imageEdgeInsets = UIEdgeInsetsMake(-25,29,0,0);
        [buttonOfcountry setImage:[UIImage imageNamed:@"icon_radio_country"] forState:UIControlStateNormal];
        [viewOfHeader addSubview:buttonOfcountry];
        [buttonOfcountry addTarget:self action:@selector(buttonOfcountryAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //省市台
        UIButton *buttonOfprovince = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonOfprovince.frame = CGRectMake(viewOfHeader.frame.size.width / 2, 0, viewOfHeader.frame.size.width / 4, 90);
        [buttonOfprovince setTitle:@"省市台" forState:UIControlStateNormal];
        [buttonOfprovince setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonOfprovince.titleEdgeInsets = UIEdgeInsetsMake(40, -19, 0, 0);
        
        buttonOfprovince.imageEdgeInsets = UIEdgeInsetsMake(-25,29,0,0);
        [buttonOfprovince setImage:[UIImage imageNamed:@"icon_radio_province"] forState:UIControlStateNormal];
        [viewOfHeader addSubview:buttonOfprovince];
        [buttonOfprovince addTarget:self action:@selector(buttonOfprovinceAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //网路台
        UIButton *buttonOfinternet = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonOfinternet.frame = CGRectMake(viewOfHeader.frame.size.width / 4 * 3, 0, viewOfHeader.frame.size.width / 4, 90);
        [buttonOfinternet setTitle:@"网络台" forState:UIControlStateNormal];
        [buttonOfinternet setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonOfinternet.titleEdgeInsets = UIEdgeInsetsMake(40, -19, 0, 0);
        
        buttonOfinternet.imageEdgeInsets = UIEdgeInsetsMake(-25,29,0,0);
        [buttonOfinternet setImage:[UIImage imageNamed:@"icon_radio_internet"] forState:UIControlStateNormal];
        [viewOfHeader addSubview:buttonOfinternet];
        [buttonOfinternet addTarget:self action:@selector(buttonOfinternetAction:) forControlEvents:UIControlEventTouchUpInside];

        
        UICollectionViewFlowLayout *FlowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        FlowLayout.itemSize = CGSizeMake(self.frame.size.width / 4.3, 35);
        
        FlowLayout.minimumInteritemSpacing = 2;
        FlowLayout.minimumLineSpacing = 2;
        FlowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 2, 5);
        FlowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.collectionViewCategories = [[UICollectionView alloc] initWithFrame:CGRectMake(0,buttonOflocal.frame.size.height, LJScreenW, viewOfHeader.frame.size.height - buttonOflocal.frame.size.height) collectionViewLayout:FlowLayout];
        _collectionViewCategories.backgroundColor = [UIColor whiteColor];
        
        _collectionViewCategories.pagingEnabled = YES;
        _collectionViewCategories.delegate = self;
        _collectionViewCategories.dataSource = self;
        
        [viewOfHeader addSubview:_collectionViewCategories];
        
        //注册collectionView的cell
        [_collectionViewCategories registerClass:[LJ_CategoriesCollectionViewCell class] forCellWithReuseIdentifier:@"cellOfCategories"];
        
        //注册TableView的cell
        [_tableView registerClass:[LJ_BoradCastTableViewCell class] forCellReuseIdentifier:@"cellOfboradCast"];

        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(UP)];
        
        
    }
    return self;
}

- (void)UP {
    [self.delegate UPDataOfBorasCast];
    [_tableView.mj_header endRefreshing];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _arrayOfCategories.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LJ_CategoriesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellOfCategories" forIndexPath:indexPath];
    LJ_CategoriesModel *model = _arrayOfCategories[indexPath.item];
    cell.modelOFCategories = model;

    
    return cell;
}





- (void)buttonOflocalAction:(UIButton *)buttonOflocal {
    NSLog(@"本地");
}

- (void)buttonOfcountryAction:(UIButton *)buttonOfcountry {
    NSLog(@"国家");
}

- (void)buttonOfprovinceAction:(UIButton *)buttonOfprovince {
    NSLog(@"省市");
}

- (void)buttonOfinternetAction:(UIButton *)buttonOfinternet {
    NSLog(@"网络");
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 0)];
    UIImageView *imageviewOfPlay = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    view.backgroundColor = [UIColor whiteColor];
    imageviewOfPlay.image = [UIImage imageNamed:@"liveRadioCellPoint@2x"];
    [view addSubview:imageviewOfPlay];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 15, 100, 30)];
    label.font = [UIFont systemFontOfSize:20];

    if (section == 0) {
   
        label.text = @"你好,大连";
    } else {
        label.text = @"排行榜";
    }
    [view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(330, 15, 70, 25);
    
    [button setTitle:@"更多 >" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [view addSubview:button];
    //    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arrayOfBroadcast.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJ_BoradCastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfboradCast" forIndexPath:indexPath];
    
    if (_arrayOfBroadcast.count != 0) {
        if (indexPath.section == 0) {
        Broadcast *broadCast = _arrayOfBroadcast[0];
        cell.arrayOfBoradCastTableViewCell = broadCast.localRadios;

        } else {
            Broadcast *broadCast = _arrayOfBroadcast[0];
            cell.arrayOfBoradCastTableViewCell = broadCast.topRadios;


        }
    }
    
    return cell;
}


- (void)setArrayOfBroadcast:(NSMutableArray *)arrayOfBroadcast {
    if (_arrayOfBroadcast != arrayOfBroadcast) {
        _arrayOfBroadcast = arrayOfBroadcast;
    }
    [self.tableView reloadData];
}

- (void)setArrayOfCategories:(NSMutableArray *)arrayOfCategories {
    if (_arrayOfCategories != arrayOfCategories) {
        _arrayOfCategories = arrayOfCategories;
    }
    [self.tableView reloadData];
}


@end
