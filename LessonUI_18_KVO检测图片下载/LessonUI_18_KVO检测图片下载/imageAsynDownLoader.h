//
//  imageAsynDownLoader.h
//  LessonUI_18_imageDownLoader
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ImagAsynDownLoaderDelegate.h"
@interface imageAsynDownLoader : NSObject

//@property (nonatomic,assign) id<ImagAsynDownLoaderDelegate> delegate;
-(instancetype)initWithImageUrl:(NSString *)urlString delegate:(id<ImagAsynDownLoaderDelegate>) delegate;


@end
