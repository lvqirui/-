//
//  imageAsynDownLoader.m
//  LessonUI_18_imageDownLoader
//
//  Created by lanou3g on 15/7/23.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

//图片异步下载器
#import "imageAsynDownLoader.h"

@implementation imageAsynDownLoader

-(instancetype)initWithImageUrl:(NSString *)urlString delegate:(id<ImagAsynDownLoaderDelegate>) delegate
{
    self = [super init];
    if (self) {
        //1.URL对象
        NSURL * url = [NSURL URLWithString:urlString];
        //2.创建请求对象
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        //3.连接对象
        //防止block 早成循环引用
            [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                //图片下载完成,代理调用协议的方法,将data数据封装成图片,然后传递
                UIImage * image = [UIImage imageWithData:data];
                //代理调用方法
                [delegate downLoader:self didFinishLoading:image];
                
                
            }];

    }
    return self;
}

@end
