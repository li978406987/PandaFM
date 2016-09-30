//
//  LJ_CategoriesCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_CategoriesCollectionViewCell.h"

@interface LJ_CategoriesCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfName;

@end

@implementation LJ_CategoriesCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfName = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfName];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.labelOfName.frame = self.contentView.bounds;
    _labelOfName.textAlignment = NSTextAlignmentCenter;
    _labelOfName.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
}

- (void)setModelOFCategories:(LJ_CategoriesModel *)modelOFCategories {
    if (_modelOFCategories != modelOFCategories) {
        _modelOFCategories = modelOFCategories;
    }
    self.labelOfName.text = modelOFCategories.name;
}



@end
