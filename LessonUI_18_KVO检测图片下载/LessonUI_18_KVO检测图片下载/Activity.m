//
//  Activity.m
//  LessonUI_18_KVO检测图片下载
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "Activity.h"

@implementation Activity

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@,%@",_title,_loc_name];
}

-(void)loadImage
{
    self.downLoader = [[imageAsynDownLoader alloc]initWithImageUrl:_image delegate:self];
}

-(void)downLoader:(imageAsynDownLoader *)downLoader didFinishLoading:(UIImage *)image
{
    self.picture = image;
    NSLog(@"%@",image);
}

@end
