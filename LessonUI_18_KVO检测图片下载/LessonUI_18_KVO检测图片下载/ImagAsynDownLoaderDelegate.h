//
//  AsynImageDownLoaderDelegate.h
//  LessonUI_18_imageDownLoader
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class imageAsynDownLoader;
@protocol ImagAsynDownLoaderDelegate <NSObject>

-(void)downLoader:(imageAsynDownLoader *)downLoader didFinishLoading:(UIImage *)image;

@end
