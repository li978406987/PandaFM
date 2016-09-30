//
//  LJ_GuessYouLikeTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/30.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_GuessYouLikeTableViewCell.h"
#import "GuessYouLikeModel.h"

@interface LJ_GuessYouLikeTableViewCell ()

@property (nonatomic, strong) UILabel *labelOftitle;

@property (nonatomic, strong) UILabel *labelOfRecReason;

@property (nonatomic, strong) UILabel *labelOfTracks;

@property (nonatomic, strong) UILabel *labelOfPlaysCounts;

@property (nonatomic, strong) UIImageView *imageviewOfcoverLarge;

@property (nonatomic, strong) UIImageView *imageViewOfPlaysCounts;

@property (nonatomic, strong) UIImageView *imageViewOfTracks;

@end

@implementation LJ_GuessYouLikeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.labelOftitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOftitle];
    }
    return self;
}


@end
