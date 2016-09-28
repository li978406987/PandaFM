//
//  LJ_CityColumnCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_CityColumnCollectionViewCell.h"
#import "LJ_CityColumnModel.h"

@interface LJ_CityColumnCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfintro;

@property (nonatomic, strong) UIImageView *imageViewOfCoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfTags;


@end

@implementation LJ_CityColumnCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfintro = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfintro];
        
        self.imageViewOfCoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfCoverLarge];
        
        self.imageViewOfTags = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfTags];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageViewOfCoverLarge.frame = CGRectMake(0, 0, 120, 100);

    
    self.labelOfintro.frame = CGRectMake(0, _imageViewOfCoverLarge.frame.size.height, _imageViewOfCoverLarge.frame.size.width, _imageViewOfCoverLarge.frame.size.height / 2);
   
    _labelOfintro.numberOfLines = 0;


    self.labelOfTitle.frame = CGRectMake(20, _imageViewOfCoverLarge.frame.size.height + _labelOfintro.frame.size.height + 10, _imageViewOfCoverLarge.frame.size.width - 20, _labelOfintro.frame.size.height / 3);
    _labelOfTitle.font = [UIFont systemFontOfSize:14];
    _labelOfTitle.textColor = [UIColor colorWithRed:0.66f green:0.66f blue:0.66f alpha:1.00f];
    
    self.imageViewOfTags.frame = CGRectMake(0, _labelOfTitle.frame.origin.y, 20, _labelOfTitle.frame.size.height);

    
}

- (void)setModelOfCityColumn:(LJ_CityColumnModel *)modelOfCityColumn{
    if (_modelOfCityColumn != modelOfCityColumn) {
        _modelOfCityColumn = modelOfCityColumn;
    }
    
    NSURL *url = [NSURL URLWithString:modelOfCityColumn.coverLarge];
    [_imageViewOfCoverLarge sd_setImageWithURL:url];
    
    _labelOfTitle.text = modelOfCityColumn.title;
    
    _labelOfintro.text = modelOfCityColumn.intro;
    
    _imageViewOfTags.image = [UIImage imageNamed:@"find_specialicon.png"];
    
}


@end
