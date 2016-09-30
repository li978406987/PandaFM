//
//  LJ_Found_DetailsViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Found_DetailsViewController.h"
#import "GuessYouLikeModel.h"
#import "LJ_GuessYouLikeTableViewCell.h"

@interface LJ_Found_DetailsViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arrayOfGuessYouLike;

@end

@implementation LJ_Found_DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _titleOfNavi;
    
    self.arrayOfGuessYouLike = [NSMutableArray array];
    
    [self handleData];
}

- (void)handleData {
    NSString *string = @"http://mobile.ximalaya.com/mobile/discovery/v1/category/keywords?categoryId=33&device=iPhone&statEvent=pageview%2Fcategory%40%E4%BB%98%E8%B4%B9%E7%B2%BE%E5%93%81&statModule=%E4%BB%98%E8%B4%B9%E7%B2%BE%E5%93%81&statPage=tab%40%E5%8F%91%E7%8E%B0_%E5%88%86%E7%B1%BB";
    
    NSDictionary *headerField = @{@"cookie": @"domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&C729BC69-BBF3-4E09-9AA6-541E9D668730&5.4.33; impl=com.gemd.iting; XUM=C729BC69-BBF3-4E09-9AA6-541E9D668730; c-oper=%E6%9C%AA%E7%9F%A5; net-mode=WIFI; res=750%2C1334; idfa=C729BC69-BBF3-4E09-9AA6-541E9D668730"};
    
    [LJNetTool GET:string body:nil headerField:headerField response:LJJSON success:^(id result) {
        NSDictionary *dictionary = (NSDictionary *)result;
        
        NSMutableArray *array = [dictionary objectForKey:@"list"];
        for (NSDictionary *dic in array) {
            GuessYouLikeModel *model = [[GuessYouLikeModel alloc] initWithDic:dic];
            [self.arrayOfGuessYouLike addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

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
