//
//  Broadcast.h
//  PandaFM
//
//  Created by 洛洛大人 on 16/9/27.
//  Copyright © 2016年 洛洛大人. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Broadcast : NSObject

@property (nonatomic, strong) NSMutableArray *categories;

@property (nonatomic, strong) NSMutableArray *localRadios;

@property (nonatomic, strong) NSString *location;

@property (nonatomic, strong) NSMutableArray *topRadios;

@end
