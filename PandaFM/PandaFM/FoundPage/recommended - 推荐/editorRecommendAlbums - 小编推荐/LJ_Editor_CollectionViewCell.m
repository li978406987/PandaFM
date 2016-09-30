//
//  LJ_Editor_CollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_Editor_CollectionViewCell.h"

@interface LJ_Editor_CollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfTrackTitle;

@property (nonatomic, strong) UIImageView *imageViewOfCoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfTags;

@end

@implementation LJ_Editor_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfTrackTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTrackTitle];
        
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
    

    self.labelOfTrackTitle.frame = CGRectMake(0, _imageViewOfCoverLarge.frame.size.height, _imageViewOfCoverLarge.frame.size.width, _imageViewOfCoverLarge.frame.size.height / 2);
    
    _labelOfTrackTitle.numberOfLines = 0;
    
    
    self.labelOfTitle.frame = CGRectMake(20, _imageViewOfCoverLarge.frame.size.height + _labelOfTrackTitle.frame.size.height + 10, _imageViewOfCoverLarge.frame.size.width - 20, _labelOfTrackTitle.frame.size.height / 3);
    _labelOfTitle.font = [UIFont systemFontOfSize:14];
    _labelOfTitle.textColor = [UIColor colorWithRed:0.66f green:0.66f blue:0.66f alpha:1.00f];
    
    self.imageViewOfTags.frame = CGRectMake(0, _labelOfTitle.frame.origin.y, 20, _labelOfTitle.frame.size.height);
    
    
}

- (void)setModelOfEditor:(LJ_EditorModel *)modelOfEditor {
    if (_modelOfEditor != modelOfEditor) {
        _modelOfEditor = modelOfEditor;
    }

    
    NSURL *url = [NSURL URLWithString:modelOfEditor.coverLarge];
    [_imageViewOfCoverLarge sd_setImageWithURL:url];
    
    _labelOfTitle.text = modelOfEditor.title;
    
    _labelOfTrackTitle.text = modelOfEditor.trackTitle;
    
    _imageViewOfTags.image = [UIImage imageNamed:@"find_specialicon.png"];

}


@end
