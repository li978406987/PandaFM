//
//  Classify_FindingNovelCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/26.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Classify_FindingNovelCollectionViewCell.h"
#import "LJ_ClassifyModel.h"

@interface Classify_FindingNovelCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOftitle;

@property (nonatomic, strong) UIImageView *imageViewOfCoverPath;


@end
@implementation Classify_FindingNovelCollectionViewCell

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
    self.imageViewOfCoverPath.frame = CGRectMake(20, 10, self.contentView.frame.size.width - 40, 50);
    
    self.labelOftitle.frame = CGRectMake(10, 60, self.contentView.frame.size.width - 20, 20);
    _labelOftitle.textAlignment = NSTextAlignmentCenter;
    _labelOftitle.font = [UIFont systemFontOfSize:14];
    
}

- (void)setModelOfClassify_Finding:(LJ_ClassifyModel *)modelOfClassify_Finding {
    if (_modelOfClassify_Finding != modelOfClassify_Finding) {
        _modelOfClassify_Finding = modelOfClassify_Finding;
    }
    NSURL *url = [NSURL URLWithString:modelOfClassify_Finding.coverPath];
    [self.imageViewOfCoverPath sd_setImageWithURL:url];
    
    self.labelOftitle.text = modelOfClassify_Finding.title;
}


@end
