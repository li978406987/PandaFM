//
//  FindingNovel_CollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/23.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "FindingNovel_CollectionViewCell.h"
#import "FindingNovel_Model.h"

@interface FindingNovel_CollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOftitle;

@property (nonatomic, strong) UIImageView *imageViewOfCoverPath;

@end

@implementation FindingNovel_CollectionViewCell

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

- (void)setModelOfFindingNovel:(FindingNovel_Model *)modelOfFindingNovel {
    if (_modelOfFindingNovel != modelOfFindingNovel) {
        _modelOfFindingNovel = modelOfFindingNovel;
    }
    NSURL *url = [NSURL URLWithString:modelOfFindingNovel.coverPath];
    [self.imageViewOfCoverPath sd_setImageWithURL:url];
    
    self.labelOftitle.text = modelOfFindingNovel.title;
}

@end
