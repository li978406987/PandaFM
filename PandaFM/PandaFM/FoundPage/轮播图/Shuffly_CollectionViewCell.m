//
//  Shuffly_CollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "Shuffly_CollectionViewCell.h"
#import "Shuffly_Model.h"

@interface Shuffly_CollectionViewCell ()
@property (nonatomic, retain) UIImageView *imageviewOfPic;

@end

@implementation Shuffly_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageviewOfPic = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageviewOfPic];
    }
    return self;
}

- (void)layoutSubviews {
 
    self.imageviewOfPic.frame = self.contentView.bounds;
    
}

- (void)setModelOfShuffly:(Shuffly_Model *)modelOfShuffly {
    if (_modelOfShuffly != modelOfShuffly) {
        _modelOfShuffly = modelOfShuffly;
    }
    NSURL *url = [NSURL URLWithString:modelOfShuffly.pic];
    [_imageviewOfPic sd_setImageWithURL:url];
}



@end
