//
//  Divider_View.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/23.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Divider_View.h"

@implementation Divider_View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *viewOfPlaceholder = [[UIView alloc] init];
    
        viewOfPlaceholder.frame = CGRectMake(0, 0, LJScreenW, 10);
        viewOfPlaceholder.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.91f alpha:1.00f];
        [self addSubview:viewOfPlaceholder];

    }
    return self;
}

@end
