//
//  LJ_HotCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_HotCollectionViewCell.h"

@interface LJ_HotCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOftrackTitle;

@property (nonatomic, strong) UIImageView *imageViewOfcoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfTags;

@end

@implementation LJ_HotCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOftrackTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOftrackTitle];
        
        self.imageViewOfcoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfcoverLarge];
        
        self.imageViewOfTags = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfTags];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageViewOfcoverLarge.frame = CGRectMake(0, 0, 120, 100);
    
    self.labelOftrackTitle.frame = CGRectMake(0, _imageViewOfcoverLarge.frame.size.height, _imageViewOfcoverLarge.frame.size.width, _imageViewOfcoverLarge.frame.size.height / 2);
    
    _labelOftrackTitle.numberOfLines = 0;
    
    self.labelOfTitle.frame = CGRectMake(20, _imageViewOfcoverLarge.frame.size.height + _labelOftrackTitle.frame.size.height + 10, _imageViewOfcoverLarge.frame.size.width - 20, _labelOftrackTitle.frame.size.height / 3);
    _labelOfTitle.font = [UIFont systemFontOfSize:14];
    _labelOfTitle.textColor = [UIColor colorWithRed:0.66f green:0.66f blue:0.66f alpha:1.00f];
    
    self.imageViewOfTags.frame = CGRectMake(0, _labelOfTitle.frame.origin.y, 20, _labelOfTitle.frame.size.height);
    
}

- (void)setModelOfHot:(LJ_HotRecommendsModel *)modelOfHot {
    if (_modelOfHot != modelOfHot) {
        _modelOfHot = modelOfHot;
    }
    NSURL *url = [NSURL URLWithString:modelOfHot.coverLarge];
    [self.imageViewOfcoverLarge sd_setImageWithURL:url];
  
    self.labelOfTitle.text = modelOfHot.title;
    
    self.labelOftrackTitle.text = modelOfHot.trackTitle;
    
    self.imageViewOfTags.image = [UIImage imageNamed:@"find_specialicon.png"];
}



@end
