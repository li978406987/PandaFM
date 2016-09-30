//
//  LJ_BaseViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/20.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BaseViewController.h"

@interface LJ_BaseViewController ()

@end

@implementation LJ_BaseViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = Hex(0xf3f3f3);
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
