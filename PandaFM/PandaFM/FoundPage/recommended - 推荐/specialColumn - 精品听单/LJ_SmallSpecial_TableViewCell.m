//
//  LJ_SmallSpecial_TableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/25.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_SmallSpecial_TableViewCell.h"

@interface LJ_SmallSpecial_TableViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfSubtitle;

@property (nonatomic, strong) UILabel *labelOfFootnote;

@property (nonatomic, strong) UIImageView *imageviewOfTags;

@property (nonatomic, strong) UIImageView *imageviewOfcoverPath;

@end

@implementation LJ_SmallSpecial_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfSubtitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfSubtitle];
        
        self.labelOfFootnote = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfFootnote];
        
        self.imageviewOfTags = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageviewOfTags];
        
        self.imageviewOfcoverPath = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageviewOfcoverPath];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageviewOfcoverPath.frame = CGRectMake(10, 10, 80, 80);
    
    self.labelOfTitle.frame = CGRectMake(_imageviewOfcoverPath.frame.size.width +_imageviewOfcoverPath.frame.origin.x + 10, _imageviewOfcoverPath.frame.origin.y, self.contentView.frame.size.width - _imageviewOfcoverPath.frame.size.width -_imageviewOfcoverPath.frame.origin.x * 2 - 10, _imageviewOfcoverPath.frame.size.height / 5 * 2);
    _labelOfTitle.font = [UIFont systemFontOfSize:21];
    
    self.labelOfSubtitle.frame = CGRectMake(_labelOfTitle.frame.origin.x, _labelOfTitle.frame.origin.y + _labelOfTitle.frame.size.height, _labelOfTitle.frame.size.width, _labelOfTitle.frame.size.height / 5 * 4);
    _labelOfSubtitle.textColor = [UIColor colorWithRed:0.72f green:0.72f blue:0.72f alpha:1.00f];
    _labelOfSubtitle.font = [UIFont systemFontOfSize:18];
    
    self.labelOfFootnote.frame = CGRectMake(_labelOfTitle.frame.origin.x + 25, _labelOfSubtitle.frame.origin.y + _labelOfSubtitle.frame.size.height, _labelOfTitle.frame.size.width, _labelOfTitle.frame.size.height);
    _labelOfFootnote.font = [UIFont systemFontOfSize:16];
    _labelOfFootnote.textColor = [UIColor colorWithRed:0.72f green:0.72f blue:0.72f alpha:1.00f];
    
    self.imageviewOfTags.frame = CGRectMake(_labelOfSubtitle.frame.origin.x, _labelOfSubtitle.frame.origin.y + _labelOfSubtitle.frame.size.height + 6, 20, _labelOfTitle.frame.size.height - 12);

}

- (void)setModelOfSpecial:(LJ_SpecialColumnModel *)modelOfSpecial {
    if (_modelOfSpecial != modelOfSpecial) {
        _modelOfSpecial = modelOfSpecial;
    }
    
    self.labelOfTitle.text = modelOfSpecial.title;
    NSURL *url = [NSURL URLWithString:modelOfSpecial.coverPath];
    [_imageviewOfcoverPath sd_setImageWithURL:url];
    
    self.labelOfSubtitle.text = modelOfSpecial.subtitle;
    
    self.labelOfFootnote.text = modelOfSpecial.footnote;
    
    _imageviewOfTags.image = [UIImage imageNamed:@"find_specialicon.png"];
    
}


@end
