//
//  LJ_Play_ViewController.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/21.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Play_ViewController.h"

@interface LJ_Play_ViewController ()

@end

@implementation LJ_Play_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 64, 100, 100);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"按钮" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
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
