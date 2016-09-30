//
//  LJ_SpecialColumn_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_SpecialColumn_TableViewCell.h"

@interface LJ_SpecialColumn_TableViewCell ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UITableView *tableview;

@end

@implementation LJ_SpecialColumn_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.tableview = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        [self.contentView addSubview:_tableview];
        self.tableview.rowHeight = 100;
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tableview.frame = self.contentView.bounds;
    
    
    
    _tableview.scrollEnabled = NO;
    
    [_tableview registerClass:[LJ_SmallSpecial_TableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LJ_SmallSpecial_TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    LJ_SpecialColumnModel *special = _arrayOfSpecial[indexPath.row];
    cell.modelOfSpecial = special;
    return cell;
}

- (void)setArrayOfSpecial:(NSMutableArray *)arrayOfSpecial {
    if (_arrayOfSpecial != arrayOfSpecial) {
        _arrayOfSpecial = arrayOfSpecial;
    }
    [_tableview reloadData];
}


@end
