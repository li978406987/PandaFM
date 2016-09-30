//
//  LJ_SingerCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/28.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_SingerCollectionViewCell.h"

@interface LJ_SingerCollectionViewCell ()
<
UITextViewDelegate
>

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfnickname;

@property (nonatomic, strong) UILabel *labelOftracksCounts;

@property (nonatomic, strong) UILabel *labelOffollowersCounts;

@property (nonatomic, strong) UIImageView *imageViewOfCoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfVIP;

@property (nonatomic, strong) UIButton *buttonOfAttention;

@property (nonatomic, strong) UIImageView *imageViewOfTracksCounts;

@property (nonatomic, strong) UIImageView *imageViewOfFollowersCounts;

@end
@implementation LJ_SingerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfnickname = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfnickname];
        
        self.imageViewOfCoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfCoverLarge];
        
        self.labelOftracksCounts = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOftracksCounts];
        
        self.labelOffollowersCounts = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOffollowersCounts];
        
        self.imageViewOfVIP = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfVIP];
        
        self.imageViewOfTracksCounts = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfTracksCounts];
        
        self.imageViewOfFollowersCounts = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfFollowersCounts];

        self.buttonOfAttention = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonOfAttention];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    //头像
    self.imageViewOfCoverLarge.frame = CGRectMake(15, 30, 70, 70);
    
    //图片变圆
    self.imageViewOfCoverLarge.layer.cornerRadius = self.imageViewOfCoverLarge.frame.size.width / 2;
    self.imageViewOfCoverLarge.clipsToBounds = YES;
    
    //V图片
    self.imageViewOfVIP.frame = CGRectMake(_imageViewOfCoverLarge.frame.size.width + 30, _imageViewOfCoverLarge.frame.origin.y - 10, _imageViewOfCoverLarge.frame.size.width / 2, _imageViewOfCoverLarge.frame.size.height / 3);
   //昵称
    self.labelOfnickname.frame = CGRectMake(_imageViewOfVIP.frame.size.width + _imageViewOfVIP.frame.origin.x + 10, _imageViewOfVIP.frame.origin.y, _imageViewOfCoverLarge.frame.size.width  * 2, _imageViewOfCoverLarge.frame.size.height / 3);
    _labelOfnickname.font = [UIFont systemFontOfSize:20];
    _labelOfnickname.textAlignment = NSTextAlignmentLeft;

    //标题
    self.labelOfTitle.frame = CGRectMake(_imageViewOfVIP.frame.origin.x, _imageViewOfVIP.frame.size.height + _imageViewOfVIP.frame.origin.y, _labelOfnickname.frame.size.width * 3, _imageViewOfVIP.frame.size.height * 2);
    _labelOfTitle.font = [UIFont systemFontOfSize:16];
    _labelOfTitle.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];

    
    self.imageViewOfTracksCounts.frame = CGRectMake(_labelOfTitle.frame.origin.x, _labelOfTitle.frame.size.height + _labelOfTitle.frame.origin.y, _imageViewOfVIP.frame.size.width / 2, _labelOfTitle.frame.size.height / 3);
    
    self.labelOftracksCounts.frame = CGRectMake(_imageViewOfTracksCounts.frame.size.width + _imageViewOfTracksCounts.frame.origin.x + 5, _imageViewOfTracksCounts.frame.origin.y, _imageViewOfTracksCounts.frame.size.width * 2, _imageViewOfTracksCounts.frame.size.height);
    _labelOftracksCounts.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];
    
    self.imageViewOfFollowersCounts.frame = CGRectMake(_labelOftracksCounts.frame.size.width + _labelOftracksCounts.frame.origin.x + 5, _labelOftracksCounts.frame.origin.y, _imageViewOfTracksCounts.frame.size.width, _labelOftracksCounts.frame.size.height);
    
    self.labelOffollowersCounts.frame = CGRectMake(_imageViewOfFollowersCounts.frame.size.width + _imageViewOfFollowersCounts.frame.origin.x + 5, _imageViewOfFollowersCounts.frame.origin.y, _imageViewOfFollowersCounts.frame.size.width * 4, _imageViewOfFollowersCounts.frame.size.height);
    _labelOffollowersCounts.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];
    
    self.buttonOfAttention.frame = CGRectMake(370, _imageViewOfVIP.frame.origin.y, _imageViewOfCoverLarge.frame.size.width / 2, _imageViewOfCoverLarge.frame.size.height);
    [_buttonOfAttention setTitle:@"加关注" forState:UIControlStateNormal];
    [_buttonOfAttention setImage:[UIImage imageNamed:@"np_headview_nofollow_n"] forState:UIControlStateNormal];
}

- (void)setModelOfAnchor:(LJ_AnchorModel *)modelOfAnchor {
    if (_modelOfAnchor != modelOfAnchor) {
        _modelOfAnchor = modelOfAnchor;
    }
    
    
    NSURL *url = [NSURL URLWithString:modelOfAnchor.largeLogo];
    [_imageViewOfCoverLarge sd_setImageWithURL:url];
    
    
    _labelOfnickname.text = modelOfAnchor.nickname;

    
    _labelOfTitle.text = modelOfAnchor.verifyTitle;
    _labelOfTitle.font = [UIFont systemFontOfSize:13];
    _labelOfTitle.numberOfLines = 2;
    
    _imageViewOfVIP.image = [UIImage imageNamed:@"me_fans_verifylogo"];
    
    _imageViewOfTracksCounts.image = [UIImage imageNamed:@"album_tracks"];
    
    _labelOftracksCounts.text = [NSString stringWithFormat:@"%ld", modelOfAnchor.tracksCounts];
    
    _imageViewOfFollowersCounts.image = [UIImage imageNamed:@"find_hotUser_fans"];
    if (modelOfAnchor.followersCounts  % 10000 / 1000 != 0) {
    _labelOffollowersCounts.text = [NSString stringWithFormat:@"%ld.%.1ld万", modelOfAnchor.followersCounts / 10000, modelOfAnchor.followersCounts  % 10000 / 1000];
    } else {
        _labelOffollowersCounts.text = [NSString stringWithFormat:@"%ld万", modelOfAnchor.followersCounts / 10000];
    }
    

    
    
}


@end
