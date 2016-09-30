//
//  LJ_List_DatasTableViewCell.m
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import "LJ_List_DatasTableViewCell.h"

@interface LJ_List_DatasTableViewCell ()
<
UITextViewDelegate
>
@property (nonatomic, retain) UILabel *labelOfTitle;

@property (nonatomic, retain) UILabel *labelOfTitleOne;

@property (nonatomic, retain) UILabel *labelOfTitleTwo;

@property (nonatomic, retain) UIImageView *imageViewOfcoverPath;

@property (nonatomic, retain) UILabel *labelOfNext;

@property (nonatomic, retain) UITextView *textView;

@end

@implementation LJ_List_DatasTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textView = [[UITextView alloc] init];
        [self.contentView addSubview:_textView];
        
        self.labelOfTitle = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitle];
        
        self.labelOfTitleOne = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitleOne];
        
        self.labelOfTitleTwo = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfTitleTwo];
        
        self.imageViewOfcoverPath = [[UIImageView alloc] init];
        [self.textView addSubview:_imageViewOfcoverPath];
        
        self.labelOfNext = [[UILabel alloc] init];
        [self.contentView addSubview:_labelOfNext];
        
        
        
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
    
    self.textView.frame = CGRectMake(5, 5, 90, 90);
    _textView.delegate = self;
    _textView.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0].CGColor;
    _textView.layer.borderWidth = 1.0f;
    
    self.imageViewOfcoverPath.frame = CGRectMake(5, 5, 80, 80);
    
    
    self.labelOfTitle.frame = CGRectMake(105, 0, 300, 50);
    self.labelOfTitle.font = [UIFont systemFontOfSize:23];
    
    self.labelOfTitleOne.frame = CGRectMake(105, 30, 270, 50);
    self.labelOfTitleOne.textColor = [UIColor grayColor];
    
    self.labelOfTitleTwo.frame = CGRectMake(105, 50, 270, 50);
    self.labelOfTitleTwo.textColor = [UIColor grayColor];
    
    self.labelOfNext.frame = CGRectMake(380, 0, 50, 100);
    self.labelOfNext.textColor = [UIColor grayColor];
    self.labelOfNext.text = @">";
    self.labelOfNext.font = [UIFont systemFontOfSize:20];
    
    
}

- (void)setModelOfList_Datas:(LJ_List_DatasModel *)modelOfList_Datas {
    if (_modelOfList_Datas != modelOfList_Datas) {
        _modelOfList_Datas = modelOfList_Datas;
    }
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", modelOfList_Datas.coverPath]];
    
    [self.imageViewOfcoverPath sd_setImageWithURL:url];
    
    self.labelOfTitle.text = modelOfList_Datas.title;
    NSString *str = @"1 ";
    self.labelOfTitleOne.text = [str stringByAppendingString:[modelOfList_Datas.firstKResults[0] objectForKey:@"title"]];
    
    NSString *str1 = @"2 ";
    self.labelOfTitleTwo.text = [str1 stringByAppendingString:[modelOfList_Datas.firstKResults[1] objectForKey:@"title"]];

}







@end
