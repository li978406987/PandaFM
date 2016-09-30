//
//  AnchorCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "AnchorCollectionViewCell.h"
#import "Divider_View.h"

@interface AnchorCollectionViewCell ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation AnchorCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.contentView addSubview:_tableView];

        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(UP)];
        
        
    }
    return self;
}

- (void)UP {
    [self.delegate UPDataOfAnchor];
    [_tableView.mj_header endRefreshing];
    
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableView.frame = CGRectMake(0, -37, self.contentView.frame.size.width, self.contentView.frame.size.height - 49);

    _tableView.delegate = self;
    _tableView.dataSource = self;

    
    //注册TableView的cell
    [_tableView registerClass:[LJ_AnchorTableViewCell class] forCellReuseIdentifier:@"cellOfAnchor"];
    //歌手TableView的cell
    [_tableView registerClass:[LJ_SingerTableViewCell class] forCellReuseIdentifier:@"cellOfSinger"];

    
}

//返回每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

//每个分区的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH * 0.05)];
    
    view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageviewOflive = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"liveRadioCellPoint@2x"]];
    imageviewOflive.frame = CGRectMake(20, 10, 20, 20);
    [view addSubview:imageviewOflive];
    UILabel *labelOfTitle = [[UILabel alloc] initWithFrame:CGRectMake(45, 10, 150, 20)];
    [view addSubview:labelOfTitle];
    
    Anchor *anchor = _arrayOfAnchor[section];
    labelOfTitle.text = anchor.title;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(330, 10, 70, 25);
    
    [button setTitle:@"更多 >" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [view addSubview:button];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 3) {
        return 360;
    } if (indexPath.section == 3) {
        return LJScreenH;
    }
    return 180;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return _arrayOfAnchor.count - 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section < 3) {
    
    LJ_AnchorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfAnchor" forIndexPath:indexPath];
    
    Anchor *anchor = _arrayOfAnchor[indexPath.section];
    
    cell.arrayOfAnchor = anchor.list;
        return cell;
    } if (indexPath.section == 3) {
        LJ_SingerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfSinger" forIndexPath:indexPath];
        Anchor *anchor = _arrayOfAnchor[indexPath.section];
        
        cell.arrayOfSinger = anchor.list;
        return cell;
    }
    
    LJ_AnchorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfAnchor" forIndexPath:indexPath];
    
    Anchor *anchor = _arrayOfAnchor[indexPath.section];
    
    cell.arrayOfAnchor = anchor.list;
    return cell;

 
}

- (void)setArrayOfAnchor:(NSMutableArray *)arrayOfAnchor {
    if (_arrayOfAnchor != arrayOfAnchor) {
        _arrayOfAnchor = arrayOfAnchor;
    }

    [_tableView reloadData];
}


@end
