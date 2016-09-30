//
//  LJ_MemberCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/24.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_MemberCollectionViewCell.h"

@interface LJ_MemberCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfNickName;

@property (nonatomic, strong) UIImageView *imageViewOfbannerUrl;

@property (nonatomic, strong) UIImageView *imageViewOfTags;


@end


@implementation LJ_MemberCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfNickName = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfNickName];
        
        self.imageViewOfbannerUrl = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfbannerUrl];
        
        self.imageViewOfTags = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfTags];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageViewOfbannerUrl.frame = CGRectMake(0, 0, 120, 100);
    
    
    self.labelOfTitle.frame = CGRectMake(0, _imageViewOfbannerUrl.frame.size.height, _imageViewOfbannerUrl.frame.size.width, _imageViewOfbannerUrl.frame.size.height / 2);
    
    _labelOfTitle.numberOfLines = 0;
    
    
    self.labelOfNickName.frame = CGRectMake(30, _imageViewOfbannerUrl.frame.size.height + _labelOfTitle.frame.size.height + 10, _imageViewOfbannerUrl.frame.size.width - 20, _labelOfTitle.frame.size.height / 3);
    _labelOfNickName.font = [UIFont systemFontOfSize:16];
    _labelOfNickName.textColor = [UIColor colorWithRed:0.66f green:0.66f blue:0.66f alpha:1.00f];
    
    self.imageViewOfTags.frame = CGRectMake(0, _labelOfNickName.frame.origin.y, 20, _labelOfNickName.frame.size.height);
    
    
}

- (void)setModelOfMember:(LJ_MemberModel *)modelOfMember {
    if (_modelOfMember != modelOfMember) {
        _modelOfMember = modelOfMember;
    }
    NSURL *url = [NSURL URLWithString:modelOfMember.bannerUrl];
    [self.imageViewOfbannerUrl sd_setImageWithURL:url];
    
    self.labelOfTitle.text = modelOfMember.title;
    
    self.labelOfNickName.text = modelOfMember.nickname;
    
    self.imageViewOfTags.image = [UIImage imageNamed:@"member_num@2x"];
    
    
    
}

@end
