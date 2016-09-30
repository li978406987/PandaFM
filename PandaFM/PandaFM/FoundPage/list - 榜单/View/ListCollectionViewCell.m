//
//  ListCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "ListCollectionViewCell.h"
#import "Divider_View.h"

@interface ListCollectionViewCell ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) NSMutableArray *arrayOfshow;

@property (nonatomic, strong) NSMutableArray *arrayOfHost;

@property (nonatomic, strong) NSMutableArray*arrayOfFocus;


@end

@implementation ListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.arrayOfshow = [NSMutableArray array];
        self.arrayOfHost = [NSMutableArray array];
        self.arrayOfFocus = [NSMutableArray array];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, LJScreenH - 50 - 64) style:UITableViewStyleGrouped];
        [self.contentView addSubview:_tableView];
        _tableView.rowHeight = 100;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *viewOfHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 200)];
        _tableView.tableHeaderView = viewOfHeader;
        viewOfHeader.backgroundColor = [UIColor grayColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, viewOfHeader.frame.size.width, viewOfHeader.frame.size.height)];
        
        [viewOfHeader addSubview:_imageView];
        
        //注册TableView的cell
        [_tableView registerClass:[LJ_List_DatasTableViewCell class] forCellReuseIdentifier:@"cellOfDatas"];
        
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(UP)];

        
    }
    return self;
}

- (void)UP {
    [self.delegate UPDataOfList];
    [_tableView.mj_header endRefreshing];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LJScreenW, 0)];
    UIImageView *imageviewOfPlay = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 20, 20)];
    view.backgroundColor = [UIColor whiteColor];
    imageviewOfPlay.image = [UIImage imageNamed:@"liveRadioCellPoint@2x"];
    [view addSubview:imageviewOfPlay];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 100, 30)];
    label.font = [UIFont systemFontOfSize:20];
    if (section == 0) {
    
        label.text = [[_arrayOfDatas firstObject] objectForKey:@"title"];
    } else {
        label.text = [[_arrayOfDatas lastObject] objectForKey:@"title"];

    }
    [view addSubview:label];
    
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        NSMutableArray *array = [_arrayOfDatas[section] objectForKey:@"list"];
    
        return array.count;
    }
    if (section == 1) {
        NSMutableArray *array = [_arrayOfDatas[section] objectForKey:@"list"];
        return array.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJ_List_DatasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOfDatas" forIndexPath:indexPath];
    if (indexPath.section == 0) {
   
    
        LJ_List_DatasModel *model = [_arrayOfshow objectAtIndex:indexPath.row];
    
        cell.modelOfList_Datas = model;
   
    return cell;
    } else {
        
        LJ_List_DatasModel *model = [_arrayOfHost objectAtIndex:indexPath.row];
        cell.modelOfList_Datas = model;
        return cell;

    }
}

- (void)setArrayOfDatas:(NSMutableArray *)arrayOfDatas {
    if (_arrayOfDatas != arrayOfDatas) {
        _arrayOfDatas = arrayOfDatas;
    }
   
    NSMutableArray *arrayOfShow = [_arrayOfDatas[0] objectForKey:@"list"];
    
    for (NSDictionary *dic in arrayOfShow) {
        
        LJ_List_DatasModel *model = [[LJ_List_DatasModel alloc] initWithDic:dic];
        [self.arrayOfshow addObject:model];
    }
    
    NSMutableArray *arrayOfHost = [_arrayOfDatas[1] objectForKey:@"list"];
    for (NSDictionary *dic in arrayOfHost) {
        LJ_List_DatasModel *model = [[LJ_List_DatasModel alloc] initWithDic:dic];
        [self.arrayOfHost addObject:model];
    }
 
    [self.tableView reloadData];
}

- (void)setFocusImages:(NSMutableArray *)focusImages {
    if (_focusImages != focusImages) {
        _focusImages = focusImages;
    }
    NSString *string = [_focusImages[0] objectForKey:@"pic"];
    
    NSURL *url = [NSURL URLWithString:string];
    [_imageView sd_setImageWithURL:url];
    
    [_imageView sd_setImageWithURL:url];

    
    
    
    [self.tableView reloadData];
}







@end
