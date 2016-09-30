//
//  LJNetTool.h
//  Bestnoteldersister
//
//  Created by 洛洛大人 on 16/7/13.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(id result);

typedef void(^failureBlock)(NSError *error);

typedef NS_ENUM(NSUInteger, LJResponseStyle) {
    LJJSON,
    LJDATA,
    LJXML,
};

typedef NS_ENUM(NSUInteger, LJRequestStyle) {
    LJBodyString,
    LJBodyJSON,
    
};


@interface LJNetTool : NSObject

+(void)GET:(NSString *)url
      body:(id)body
headerField:(NSDictionary *)headers
  response:(LJResponseStyle)responseStyle
   success:(successBlock)success
   failure:(failureBlock)failure;

+(void)POST:(NSString *)url
       body:(id)body
  bodyStyle:(LJRequestStyle)bodyStyle
headerField:(NSDictionary *)headers
  response:(LJResponseStyle)responseStyle
   success:(successBlock)success
   failure:(failureBlock)failure;













@end
