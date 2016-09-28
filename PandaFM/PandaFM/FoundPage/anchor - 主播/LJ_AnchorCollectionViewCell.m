//
//  LJ_AnchorCollectionViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_AnchorCollectionViewCell.h"

@interface LJ_AnchorCollectionViewCell ()
<
UITextViewDelegate
>

@property (nonatomic, strong) UILabel *labelOfTitle;

@property (nonatomic, strong) UILabel *labelOfnickname;

@property (nonatomic, strong) UIImageView *imageViewOfCoverLarge;

@property (nonatomic, retain) UITextView *textView;

@end

@implementation LJ_AnchorCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textView = [[UITextView alloc] init];
        [self.contentView addSubview:_textView];
        
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfnickname = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfnickname];
        
        self.imageViewOfCoverLarge = [[UIImageView alloc] init];
        [self.contentView addSubview: _imageViewOfCoverLarge];
        
    }
    return self;
}

//textview为不可编辑状态
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if ([_textView isFirstResponder]) {
        return NO;
    }
    return NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textView.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height - 40);
    _textView.delegate = self;
    _textView.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    _textView.layer.borderWidth = 1.0f;

    self.imageViewOfCoverLarge.frame = CGRectMake(5, 5, 100, 100);
    
    self.labelOfnickname.frame = CGRectMake(5, _imageViewOfCoverLarge.frame.size.height + 10, _imageViewOfCoverLarge.frame.size.width, _imageViewOfCoverLarge.frame.size.height / 5);
    
    self.labelOfTitle.frame = CGRectMake(5, _textView.frame.size.height, _imageViewOfCoverLarge.frame.size.width, _labelOfnickname.frame.size.height * 2);
    

}

- (void)setModelOfAnchor:(LJ_AnchorModel *)modelOfAnchor {
    if (_modelOfAnchor != modelOfAnchor) {
        _modelOfAnchor = modelOfAnchor;
    }
    
    
    NSURL *url = [NSURL URLWithString:modelOfAnchor.largeLogo];
    [_imageViewOfCoverLarge sd_setImageWithURL:url];
    
    
    _labelOfnickname.text = modelOfAnchor.nickname;
    
    _labelOfnickname.font = [UIFont systemFontOfSize:15];
    _labelOfnickname.textColor = [UIColor colorWithRed:0.75f green:0.66f blue:0.51f alpha:1.00f];
    _labelOfnickname.textAlignment = NSTextAlignmentCenter;
    
    _labelOfTitle.text = modelOfAnchor.verifyTitle;
    _labelOfTitle.font = [UIFont systemFontOfSize:13];
    _labelOfTitle.numberOfLines = 2;
    
    
}


@end
