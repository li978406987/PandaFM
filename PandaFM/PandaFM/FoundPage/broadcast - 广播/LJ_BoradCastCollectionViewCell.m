//
//  LJ_BoradCastCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/29.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_BoradCastCollectionViewCell.h"

//     icon_radio_hide  上    icon_radio_show下

@interface LJ_BoradCastCollectionViewCell ()

@property (nonatomic, strong) UILabel *labelOfName;

@property (nonatomic, strong) UILabel *labelOfProgramName;

@property (nonatomic, strong) UILabel *labelOfPlayCount;

@property (nonatomic, strong) UIImageView *imageviewOfBackground;

@property (nonatomic, strong) UIImageView *imageViewOfcoverLarge;

@property (nonatomic, strong) UIButton *buttonOfPlay;

@end

@implementation LJ_BoradCastCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfName = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfName];
        
        self.labelOfProgramName = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfProgramName];
        
        self.labelOfPlayCount = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfPlayCount];
        
        self.imageviewOfBackground = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageviewOfBackground];
        
        self.imageViewOfcoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageViewOfcoverLarge];
        
        self.buttonOfPlay = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonOfPlay];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageviewOfBackground.frame = CGRectMake(10, 10, self.contentView.frame.size.width / 5, self.contentView.frame.size.height);
    
    self.imageViewOfcoverLarge.frame = CGRectMake(_imageviewOfBackground.frame.origin.x + 5, _imageviewOfBackground.frame.origin.y + 5, _imageviewOfBackground.frame.size.width - 10, _imageviewOfBackground.frame.size.height - 10);
    
    self.labelOfName.frame = CGRectMake(_imageviewOfBackground.frame.size.width + 20, _imageviewOfBackground.frame.origin.y, _imageviewOfBackground.frame.size.width * 3, _imageviewOfBackground.frame.size.height / 3);
    
    self.labelOfProgramName.frame = CGRectMake(_labelOfName.frame.origin.x, _labelOfName.frame.size.height + _labelOfName.frame.origin.y, _labelOfName.frame.size.width, _labelOfName.frame.size.height);
    
    self.labelOfPlayCount.frame = CGRectMake(_labelOfProgramName.frame.origin.x, _labelOfProgramName.frame.size.height + _labelOfProgramName.frame.origin.y, _labelOfProgramName.frame.size.width, _labelOfProgramName.frame.size.height);
    
    self.buttonOfPlay.frame = CGRectMake(_imageviewOfBackground.frame.size.width * 4, 0, _imageviewOfBackground.frame.size.width, _imageviewOfBackground.frame.size.height);
}

- (void)setModelOfBroadCast:(LJ_BoradCastModel *)modelOfBroadCast {
    if (_modelOfBroadCast != modelOfBroadCast) {
        _modelOfBroadCast = modelOfBroadCast;
    }
    self.imageviewOfBackground.image = [UIImage imageNamed:@"album_cover_bg"];
    

    [self.imageViewOfcoverLarge sd_setImageWithURL:[NSURL URLWithString:modelOfBroadCast.coverLarge]];
    
    self.labelOfName.text = modelOfBroadCast.name;
    _labelOfProgramName.font = [UIFont systemFontOfSize:15];
    _labelOfProgramName.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];
    
    if (modelOfBroadCast.programName == nil) {
        self.labelOfProgramName.text = @"直播中: 暂无节目单";
    } else {
        self.labelOfProgramName.text = [NSString stringWithFormat:@"直播中 : %@", modelOfBroadCast.programName];
    }
    
    _labelOfPlayCount.font = [UIFont systemFontOfSize:13];
    _labelOfPlayCount.textColor = [UIColor colorWithRed:0.64f green:0.64f blue:0.64f alpha:1.00f];
    if (modelOfBroadCast.playCount  % 10000 / 1000 != 0) {
        _labelOfPlayCount.text = [NSString stringWithFormat:@"收听人数 : %ld.%.1ld万人", modelOfBroadCast.playCount / 10000, modelOfBroadCast.playCount  % 10000 / 1000];
    } else {
        _labelOfPlayCount.text = [NSString stringWithFormat:@"收听人数 : %ld万人", modelOfBroadCast.playCount / 10000];
    }

    [self.buttonOfPlay setImage:[UIImage imageNamed:@"liveRadioCellPlay"] forState:UIControlStateNormal];
    
    

}






@end
