//
//  LJ_CollectionView.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/22.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LJ_CollectionViewDelegate <NSObject>

- (void)pushToDetailWith:(NSString *)detailId;

@end

@interface LJ_CollectionView : UIView

@property (nonatomic, assign) id<LJ_CollectionViewDelegate>delegate;

// >>>>>>>>>>>>>>>>>>>>>>>>>  滚动控制接口

// 是否自动滚动, 默认YES
@property (nonatomic, assign) BOOL autoScroll;

// 滚动时间, 默认2.0秒
@property (nonatomic, assign) CGFloat timerInterval;

// 是否显示pageControl 默认显示(YES)
@property (nonatomic, assign) BOOL showPageControl;

@property (nonatomic, retain) NSArray *imageURLStringsGroup;
// 本地图片初始化方法
- (instancetype)initWithFrame:(CGRect)frame imagesGroup:(NSArray *)imagesGroup;

// 网络图片轮播初始化
- (instancetype)initWithFrame:(CGRect)frame imagesURLStringGroup:(NSArray *)imageURLStringsGroup;
@property (nonatomic, retain) NSArray *modelArr;


@end
