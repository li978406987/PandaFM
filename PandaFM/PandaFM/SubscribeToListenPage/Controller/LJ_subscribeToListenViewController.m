//
//  LJ_subscribeToListenViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/20.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_subscribeToListenViewController.h"

@interface LJ_subscribeToListenViewController ()

@end

@implementation LJ_subscribeToListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *labelODONe = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 100, 50)];
    [self.view addSubview:labelODONe];
    labelODONe.text = @"吼吼";

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
