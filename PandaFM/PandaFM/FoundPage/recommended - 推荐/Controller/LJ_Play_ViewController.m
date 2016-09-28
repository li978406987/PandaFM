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
    // Do any additional setup after loading the view.
}

+ (instancetype)playViewController {
    
    static LJ_Play_ViewController *play = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        play = [[LJ_Play_ViewController alloc] init];
    });
    return play;
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
