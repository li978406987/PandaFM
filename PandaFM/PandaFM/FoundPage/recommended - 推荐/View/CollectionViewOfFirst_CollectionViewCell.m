//
//  CollectionViewOfFirst_CollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "CollectionViewOfFirst_CollectionViewCell.h"
#import "CollectionViewOfFirst_Model.h"

@interface CollectionViewOfFirst_CollectionViewCell ()

@property (nonatomic, retain) UILabel *labelOfTitle;

@property (nonatomic, retain) UILabel *label;

@end

@implementation CollectionViewOfFirst_CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.label = [[UILabel alloc] init];
        [_labelOfTitle addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews {
    self.labelOfTitle.frame = self.contentView.bounds;
    
    _labelOfTitle.textAlignment = NSTextAlignmentCenter;
    
    
    self.label.frame = CGRectMake(LJScreenW * 0.0483, _labelOfTitle.frame.size.height - LJScreenH * 0.0027, _labelOfTitle.frame.size.width - LJScreenW * 0.0966, 2);
}

- (void)setModelOfFirst:(CollectionViewOfFirst_Model *)modelOfFirst {
    if (_modelOfFirst != modelOfFirst) {
        _modelOfFirst = modelOfFirst;
    }

    if ([modelOfFirst.title isEqualToString:@"推荐"]) {
        _labelOfTitle.text = modelOfFirst.title;
        _labelOfTitle.textColor = [UIColor colorWithRed:0.96f green:0.42f blue:0.26f alpha:1.00f];
        _labelOfTitle.font = [UIFont systemFontOfSize:22];
        _label.backgroundColor = _labelOfTitle.textColor;
    } else {
         _labelOfTitle.text = modelOfFirst.title;
        _labelOfTitle.font = [UIFont systemFontOfSize:19];
    }

}

- (void)setIsSeleted:(BOOL)isSeleted {
    if (isSeleted == YES) {
        _labelOfTitle.textColor = [UIColor blackColor];
        _labelOfTitle.font = [UIFont systemFontOfSize:19];
        _label.backgroundColor = [UIColor clearColor];
        
    }else {

    _labelOfTitle.textColor = [UIColor colorWithRed:0.96f green:0.42f blue:0.26f alpha:1.00f];
    _labelOfTitle.font = [UIFont systemFontOfSize:22];
    _label.backgroundColor = _labelOfTitle.textColor;
    }
}


@end
