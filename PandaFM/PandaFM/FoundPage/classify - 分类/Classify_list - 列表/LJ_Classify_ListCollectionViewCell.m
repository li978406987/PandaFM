//
//  LJ_Classify_ListCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Classify_ListCollectionViewCell.h"

@interface LJ_Classify_ListCollectionViewCell ()
@property (nonatomic, strong) UILabel *labelOftitle;

@property (nonatomic, strong) UIImageView *imageViewOfCoverPath;


@end

@implementation LJ_Classify_ListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOftitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOftitle];
        
        self.imageViewOfCoverPath = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfCoverPath];
    }
    return self;
}

- (void)layoutSubviews {
    self.imageViewOfCoverPath.frame = CGRectMake(20, 20, 20, 20);
    
    self.labelOftitle.frame = CGRectMake(_imageViewOfCoverPath.frame.size.width + _imageViewOfCoverPath.frame.origin.x + 20, 10, self.contentView.frame.size.width / 2, 40);
    _labelOftitle.textAlignment = NSTextAlignmentLeft;
    _labelOftitle.font = [UIFont systemFontOfSize:14];
    
}

- (void)setModelOfClassify:(LJ_Classify_ListModel *)modelOfClassify {
    if (_modelOfClassify != modelOfClassify) {
        _modelOfClassify = modelOfClassify;
    }

    NSURL *url = [NSURL URLWithString:modelOfClassify.coverPath];
    [self.imageViewOfCoverPath sd_setImageWithURL:url];

    self.labelOftitle.text = modelOfClassify.title;
    
    
}


@end
