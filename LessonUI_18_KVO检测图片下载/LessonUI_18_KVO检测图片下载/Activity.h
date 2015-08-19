//
//  Activity.h
//  LessonUI_18_KVO检测图片下载
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "imageAsynDownLoader.h"
@interface Activity : NSObject<ImagAsynDownLoaderDelegate>

@property (nonatomic,retain) NSString * title;
@property (nonatomic,retain) NSString * image;
@property (nonatomic,retain) NSString * loc_name;
@property (nonatomic,retain)UIImage * picture;
@property (nonatomic,retain)imageAsynDownLoader * downLoader;

-(void)downLoader:(imageAsynDownLoader *)downLoader didFinishLoading:(UIImage *)image;
-(void)loadImage;
@end
