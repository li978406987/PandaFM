//
//  LJ_GuessCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/23.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_GuessCollectionViewCell.h"
#import "LJ_GuessModel.h"

@interface LJ_GuessCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfTags;

@property (nonatomic, strong) UIImageView *imageViewOfCoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfTags;


@end

@implementation LJ_GuessCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfTags = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTags];
        
        self.imageViewOfCoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfCoverLarge];
        
        self.imageViewOfTags = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfTags];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    

    self.imageViewOfCoverLarge.frame = CGRectMake(0, 0, 120, 150);
    
     self.labelOfTitle.frame = CGRectMake(0, _imageViewOfCoverLarge.frame.size.height, _imageViewOfCoverLarge.frame.size.width, _imageViewOfCoverLarge.frame.size.height / 5);
    
    self.labelOfTags.frame = CGRectMake(20, _imageViewOfCoverLarge.frame.size.height + _labelOfTitle.frame.size.height, _imageViewOfCoverLarge.frame.size.width - 20, _labelOfTitle.frame.size.height);
    
    _imageViewOfTags.frame = CGRectMake(0, _labelOfTags.frame.origin.y + 10, 20, _labelOfTags.frame.size.height - 20);
    

}

- (void)setModelOfGuess:(LJ_GuessModel *)modelOfGuess {
    if (_modelOfGuess != modelOfGuess) {
        _modelOfGuess = modelOfGuess;
    }
    
    
    NSURL *url = [NSURL URLWithString:modelOfGuess.coverLarge];
    [_imageViewOfCoverLarge sd_setImageWithURL:url];
    
    
    _labelOfTags.text = modelOfGuess.tags;
    
    _labelOfTags.font = [UIFont systemFontOfSize:13];
    _labelOfTags.textColor = [UIColor colorWithRed:0.68f green:0.68f blue:0.68f alpha:1.00f];
    
   
    _labelOfTitle.text = modelOfGuess.title;
    _labelOfTitle.font = [UIFont systemFontOfSize:15];   
    
    if ([modelOfGuess.tags isEqualToString:@""]) {
        
        self.imageViewOfTags.hidden = YES;
        self.labelOfTags.hidden = YES;
    } else {
 
        _imageViewOfTags.image = [UIImage imageNamed:@"find_tagicon@3x.png"];
        
        self.imageViewOfTags.hidden = NO;
        self.labelOfTags.hidden = NO;

        

    }
}

@end
